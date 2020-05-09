
import 'package:de_makes_final/routes.dart';
import 'package:de_makes_final/service_locator.dart';
import 'package:de_makes_final/state/app_state.dart';
import 'package:de_makes_final/utils/utility.dart';
import 'package:flutter/material.dart';


class OrgTile extends StatelessWidget {
  final Map orgData;
  OrgTile({
    Key key,
    this.orgData,
  });

  List<Widget> getRequestTiles(BuildContext context){
    List<Widget> out =[];
    List requestDataList= safeGet(key:"RequestsList", map:orgData, alt:[]);
    requestDataList.forEach((requestData) {
      out.add(requestTile(requestData, context));
    });
    return out;
  }
  Widget requestTile(Map requestData, BuildContext context){
    var appState = locator<AppState>();
    bool loggedIn = appState.loggedIn;
    String name=safeGet(key:"designName", map:requestData, alt:"");
    var quantity = safeGet(key:"quantityRequested", map:requestData, alt:0);

 return ExpansionTile(
      title: Text("$quantity $name"),
      trailing: 
      Container(
        height: 50.0,
        width: 50.0, // TOD add children requests
        child: Center(
          child: loggedIn?
          Container(
             // margin: EdgeInsets.symmetric(vertical: 15),
              width:100.0,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.grey[300],
                onPressed: (){
                  appState.initClaim(orgData: orgData, requestData: requestData);
                    tappedMenuButton(context, "/claim");
                },
                //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text("Make Claim",),
              ),
            ):
          Container(
            height: 15.0,
            width: 15.0,
                   decoration: BoxDecoration(
                     border: Border.all(color:Colors.black, width:1.0),
                  color: Colors.green,
                  shape: BoxShape.circle),
          ),
        ),
      ),
     children:getClaimTiles(requestData)
      );
  }
  List<Widget> getClaimTiles(Map requestData){
    List<Widget> out =[];
    List claimDataList= safeGet(key:"claimsList", map:requestData, alt:[]);
    claimDataList.forEach((claimData) {
      out.add(claimTile(claimData));
    });
    return out;
    //   .map((claimData) => OrgReqClaimTile(requestData: requestData, orgData: orgData,claimData: claimData,)).toList(),
  }
  Widget claimTile(Map claimData)=>ListTile(
      title: Text("${safeGet(key:"quantity", map:claimData, alt:0)}"),
      trailing: Container(
        height: 50.0,
        width: 50.0,   // TOD add children requests
        child: Center(
          child: Container(
            height: 15.0,
            width: 15.0,
                   decoration: BoxDecoration(
                     border: Border.all(color:Colors.black, width:1.0),
                  color: Colors.green,
                  //statusColor[organization.status],
                  shape: BoxShape.circle),
          ),
        ),
      ),
      );

  

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left:25.0),
      child: ExpansionTile(
        title: Text(safeGet(key:"Name", map:orgData, alt:"")),
        trailing: Container(
          height: 50.0,
          width: 50.0,// TOD add children requests
          child: Center(
            child: Container(
              height: 15.0,
              width: 15.0,
                     decoration: BoxDecoration(
                       border: Border.all(color:Colors.black, width:1.0),
                    color: Colors.green,//statusColor[organization.status],
                    shape: BoxShape.circle),
            ),
          ),
        ),
      
        // TODO
        children: getRequestTiles(context)
        // safeGet(key:"RequestsList", map:orgData, alt:[])
        // .map((requestData) => OrgRequestTile(requestData: requestData, orgData: orgData,)).toList(),
        ),
    );
  }



 
}

 // List<Widget> reqList(){
  //   List rid = safeGet(key:"RequestsList", map:orgData, alt:[]);

  // }

// Widget requestDestTile(Map orgData)=>

  // Widget requestTile(Request request){

  //   Design d = designs.firstWhere((des) => des.id==request.designID);
  //   print(d.name);
  //   return
  //   ListTile(
  //     leading: Container(width:40,
  //     child: (d.imagePath==null)? Image.network("https://i.ya-webdesign.com/images/image-placeholder-png-2.png"):
  //      d.imagePath.contains("http")?Image.network(d.imagePath):Image.asset(d.imagePath),
  //     ),
  //     title: Row(
  //       children: [
  //         Text(
  //          d.name),
  //          Text("  ${request.quantityRecieved}/${request.quantityRequested}")
  //       ],
  //     ),
  //     );
  // }