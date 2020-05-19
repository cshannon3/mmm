

import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/utils/utility.dart';
import 'package:flutter/material.dart';

class AdminUsers extends StatefulWidget {
  @override
  _AdminUsersState createState() => _AdminUsersState();
}

class _AdminUsersState extends State<AdminUsers> {
    bool showInactive = true;
    bool showVerified = true;
    bool showAll= false;
    AppState appState;

  @override
  Widget build(BuildContext context) {
    appState = locator<AppState>();
    return ExpansionTile(title: Text("Users"),
        children: [
          filterTab(),
        ]..addAll(appState.dataRepo.getItemsWhere("users").map((e) => ListTile(
          title: Text(safeGet(key: "name", map:e, alt:""))
          )).toList()
        ),
    );
  }
    Widget filterTab() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          checkBox("All", showAll, (v)=>showAll=v),
          Expanded(child: Container(),),
          checkBox("Show Inactive",showInactive, (v)=>showInactive=v),
          SizedBox(width: 20.0),
          checkBox("Show Verified",showVerified, (v)=>showVerified=v),
    ]);
  }

deleteItem(String modelID, String collectionName)=>
      setState((){
        appState.dataRepo.deleteItem(modelID: modelID, collectionName:collectionName);
      });

  Widget checkBox(String title, bool val, Function(bool v) onChange)=>Column(
            children: <Widget>[
              Checkbox(
                  value: val,
                  onChanged: (value) { setState(() {onChange(value);  }); },
                  activeColor: Colors.green,),
              Text(title),
              ],);
}


