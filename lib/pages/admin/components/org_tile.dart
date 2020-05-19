import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminOrg extends StatefulWidget {
  @override
  _AdminOrgState createState() => _AdminOrgState();
}

class _AdminOrgState extends State<AdminOrg> {
  bool showInactive = true;
  bool showVerified = true;
  bool showAll = false;
  bool isFaceShieldOn = true;
  bool isEarSaverOn = true;
  AppState appState;

  @override
  Widget build(BuildContext context) {
    appState = locator<AppState>();
    List orgs = getOrgData();
    return Column(
      children: <Widget>[
        SizedBox( height: 40.0, ),
        ExpansionTile(
            title: Text("Organizations"),
            children: [
              filterTab(),
            ]..addAll(orgs
                .map((e) => OrgAdminTile(
                      orgData: e,
                      onDelete: deleteItem,
                    ))
                .toList())),
      ],
    );
  }

  Widget filterTab() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      checkBox("Face Shields", isFaceShieldOn, (v) => isFaceShieldOn = v),
      SizedBox(width: 20.0),
      checkBox("Ear Savers", isEarSaverOn, (v) => isEarSaverOn = v),
      checkBox("All", showAll, (v) => showAll = v),
      Expanded( child: Container(),),
      checkBox("Show Inactive", showInactive, (v) => showInactive = v),
      SizedBox(width: 20.0),
      checkBox("Show Verified", showVerified, (v) => showVerified = v),
    ]);
  }

  deleteItem(String modelID, String collectionName) => setState(() {
        appState.dataRepo.deleteItem(modelID: modelID, collectionName: collectionName); });

  Widget checkBox(String title, bool val, Function(bool v) onChange) => Column(
        children: <Widget>[
          Checkbox(
            value: val,
            onChanged: (value) {
              setState(() { onChange(value);}); },
            activeColor: Colors.green,
          ),Text(title),
        ],
      );

  List getOrgData() {
    List res = [];
    List designsIn = [];
    if (isFaceShieldOn) designsIn.add("5f2009e0-55a8-4d4b-aa6a-a9becf5c9392");
    if (isEarSaverOn) designsIn.add("fa900ce5-aae8-4a69-92c3-3605f1c9b494");
    if (designsIn == []) return [];
    List orgs = [];
    if (!showInactive) {
      try {
        orgs = appState.dataRepo.getItemsWhere("orgs", fieldFilters: {
          "isActive": false,
        });
      } catch (e) { print("error"); }
    } else { orgs = appState.dataRepo.getItemsWhere("orgs"); }
    if (showAll) {  res = orgs;
    } else {
      orgs?.forEach((org) {
        List y =
            appState.dataRepo.linkedDataList("requests", "orgID", org["id"]);
        bool add = false;
        int i = 0;
        while (i < y.length && !add) {
          bool ver = safeGet(map: y[i], key: "isVerified", alt: false);
          if (((showVerified && ver) || !showVerified) &&
              designsIn.contains(y[i]["designID"])) {
            add = true;
          } i++; }
        if (add) res.add(org);});
    }
    return res;
  }
}

class OrgAdminTile extends StatefulWidget {
  final Map orgData;
  final Function(String, String) onDelete;

  OrgAdminTile({Key key, @required this.orgData, @required this.onDelete});

  @override
  _OrgAdminTileState createState() => _OrgAdminTileState();
}

class _OrgAdminTileState extends State<OrgAdminTile> {
  AppState appState;

  @override
  void initState() {
    appState = locator<AppState>();
    super.initState();
  }

  List<Widget> getRequestTiles(BuildContext context) {
    List<Widget> out = [];
    List requestDataList = appState.dataRepo
        .linkedDataList("requests", "orgID", widget.orgData["id"]);
    safeGet(key: "requestsList", map: widget.orgData, alt: []);
    requestDataList.forEach((requestData) {
      out.add(requestAdminTile(requestData, context));
    });
    return out;
  }

  Widget requestAdminTile(Map requestData, BuildContext context) {
    Map designData = appState.dataRepo.getItemByID("designs", requestData["designID"]);

    String designName = safeGet(key: "name", map: designData, alt: "Design");
    return ExpansionTile(
        title: Row(
          children: <Widget>[
            Text("$designName"),
          ],
        ),
        children: getClaimTiles(requestData));
  }

  List<Widget> getClaimTiles(Map requestData) {
    List<Widget> out = [];
    List claimDataList = appState.dataRepo
        .linkedDataList("claims", 'requestID', requestData["id"]);

    claimDataList.forEach((claimData) {
      out.add(claimTile(claimData));
    });
    return out;
  }

  Widget claimTile(Map claimData) {
    Map userData = appState.dataRepo.getItemByID(
        "users", safeGet(key: "userID", map: claimData, alt: ""));
    String userName = safeGet(key: "displayName", map: userData, alt: "User");
    return ListTile(
      title: Text(
          "$userName claimed ${safeGet(key: "quantity", map: claimData, alt: 0)}"),
      trailing: Container(
        height: 50.0,
        width: 50.0, // TOD add children requests
        child: Center(
          child: Container(
            height: 15.0,
            width: 15.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                color: Colors.green,
                shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ExpansionTile(
          title: Column(
            children: <Widget>[
              Text(
                safeGet(key: "name", map: widget.orgData, alt: ""),
                style: TextStyle(fontSize: 15.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  IconButton(
                      icon: Icon(FontAwesomeIcons.checkCircle),
                      onPressed: null),
                  IconButton(
                      icon: Icon(Icons.close),
                      color: Colors.red,
                      onPressed: () {
                        widget.onDelete(widget.orgData["id"], "orgs");
                      }),
                ],
              ),
            ],
          ),
          children: getRequestTiles(context)),
    );
  }
}
