
import 'package:delaware_makes/forms/form_manager.dart';
import 'package:delaware_makes/pages/locations/components/request_tile.dart';
import 'package:delaware_makes/pages/locations/locations_page.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/utils/utility.dart';
import 'package:flutter/material.dart';

class OrgTile extends StatelessWidget {
  
  Map orgData;
  OrgCounts orgCounts;
  OrgTile({
    Key key,
    @required this.orgData,
    @required this.orgCounts,
  });
  AppState appState;
  //PlatformInfo platformInfo;
  //OrgCounts orgCounts = OrgCounts();

  List<Widget> getRequestTiles(){
    List requestList= safeGet(key:"requests", map:orgData, alt:[]);
  
    List<Widget> out =[]; //List requestList= safeGet(key:"requests", map:orgData, alt:[]);
    requestList.forEach((requestData) { // print(requestData);
      out.add(
        RequestTile(
          requestID: requestData["id"],
          designID: requestData["designID"], 
          requestCounts: orgCounts.requestCounts[requestData["id"]],
          loggedIn: appState.loggedIn,
          makeClaim:(){
             var formManager = locator<FormManager>();
             formManager.initClaim(orgData: orgData, requestData: requestData);
            formManager.setForm("claim", resetBuffer: false);
    
                      },));
    });
    return out;
  }
  @override
  Widget build(BuildContext context) {
    appState=  locator<AppState>();
    //platformInfo=locator<PlatformInfo>();  // print(orgData);
   // orgCounts.init(orgData, currentUserID: safeGet(key:"id", map:appState.currentUser, alt:null));
    bool isDone= safeGet(key:"isDone", map:orgData, alt:false);

    return  Padding(
      padding: const EdgeInsets.only(left:25.0),
      child: ExpansionTile(
        title: Column(
          children: <Widget>[
            Text(safeGet(key:"name", map:orgData, alt:"")),
        
          ],
        ),
        trailing: Padding(
          padding: EdgeInsets.all(3.0),
          child: Container(
            decoration: BoxDecoration(
              border:Border.all(
                color:(orgCounts.isDone|| isDone)?Colors.green:Colors.red,
                width:2
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            height: 80.0,
            width:100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text("Unclaimed: ${orgCounts.totalRequests-orgCounts.totalClaims}",style: TextStyle(fontSize:10.0),),
              Text("Claimed(open): ${orgCounts.totalClaims-orgCounts.totalDelivered}",style: TextStyle(fontSize:10.0),),
              Text("Delivered: ${orgCounts.totalDelivered}", style: TextStyle(fontSize:10.0),),
            
            ],),
          ),
        ),
        children: getRequestTiles()
        ),
    );
  }
}
 