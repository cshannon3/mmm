
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
  //   orgCounts.isOpenForUser?Container(
          //   height: 15.0,
          //   width: 15.0,
          //          decoration: BoxDecoration(
          //            border: Border.all(color:Colors.black, width:1.0),
          //         color:  Colors.yellow,
          //         shape: BoxShape.circle
          //         ),
          // ):SizedBox()
// class OrgCounts {
//   int totalRequests=0;
//   int totalClaims=0;
//   int totalDelivered=0;
//   bool isOpenForUser=false;
//   Map<String, RequestCounts> requestCounts={};
//   bool isDone=false;
//   OrgCounts();

//   init(Map orgData, {String currentUserID}){
//     isDone=true;
//     isOpenForUser=false;
//     totalRequests=0;
//      totalClaims=0;
//      totalDelivered=0;
//      requestCounts={};
//      if(orgData.containsKey("requests")){
//         orgData["requests"].forEach((reqData){
//           RequestCounts c = RequestCounts();
//           c.init(reqData,orgData["claims"],currentUserID: currentUserID );
//           requestCounts[reqData["id"]]=c;
//           totalClaims+=c.numClaimed;
//           totalDelivered+=c.numDelivered;
//           totalRequests+=c.numRequested;
//           if(c.isOpenForUser){isOpenForUser=true;}
//        });
//      }
//      if(totalDelivered<totalRequests)isDone=false;
// }
// }
// class RequestCounts{
//   String id;
//   int numRequested=0;
//   int numClaimed=0;
//   int numDelivered=0;
//   bool isOpenForUser=false;
//   bool isDone = false;

//   RequestCounts();
//   init(Map requestData, List claims, {String currentUserID}){
//     isOpenForUser=false;
//     id = safeGet(key: "id", map:requestData, alt:"");
//     numRequested = safeGet(key: "quantityRequested", map:requestData, alt:0);
//     claims.forEach((claim) {
//         if(id == safeGet(key: "requestID", map:claim, alt:"")){
//           if(currentUserID!=null && safeGet(key: "userID", map: claim, alt: "")==currentUserID){
//             isOpenForUser=true;
//           }
//           int cl = safeGet(key: "quantity", map: claim, alt: 0);
//           numClaimed+=cl;
//           if(safeGet(key: "updateID", map: claim, alt: "")!=""){
//             numDelivered+=cl;
//           }        
//         }
//     });
//     isDone = (numDelivered>=numRequested);
//     // print(numDelivered);
//     // print(numClaimed);
//     // print(numRequested);

//   }
  

// }



                    // appState.initClaim(orgData: orgData, requestData: requestData);
                        // platformInfo.setOverlay("claim");
//   List getTotalRequests(Map orgData){
//   List reqs = [0,0, true];

//   if(orgData.containsKey("requests")){
//     orgData["requests"].forEach((data){
//       reqs[0]+=safeGet(key: "quantityRequested", map:data, alt:0);
//       String id = safeGet(key: "id", map:data, alt:null);
//       if(id!=null){
//         orgData["claims"].forEach((claim){
//           if(id == safeGet(key: "id", map:data, alt:"")){
            
//           }
//         });
//         if(!data["isDone"])
//             reqs[2]=false;
//       }
//     });
//   }
//   return reqs;
// }

// print(requestIDs);
    //List requestDataList = requestIDs.map((id) => appState.dataRepo.getItemByID("request", id, addLinks: true)).toList();
   // List reqs = getTotalRequests(orgData);
  //requestData= appState.dataRepo.addLinkedData("requests", requestData["id"], requestData);
      //print(requestData);
    //  Map designData =appState.dataRepo.getItemByID("designs", requestData["designID"]);


/*
List reqs = getTotalRequests(orgData);
safeGet(key:"Name", map:orgData, alt:"")
safeGet(key:"claimsList", map:requestData, alt:[]);
safeGet(key:"user name", map:claimData, alt:"User");
 List requestDataList= safeGet(key:"requestsList", map:orgData, alt:[]);
String name=safeGet(key:"designName", map:requestData, alt:"");
    List reqs= getRequestNums(requestData);
*/

 // safeGet(key:"RequestsList", map:orgData, alt:[])
        // .map((requestData) => OrgRequestTile(requestData: requestData, orgData: orgData,)).toList(),
       
       // Container(
        //   height: 50.0,
        //   width: 50.0,// TOD add children requests
        //   child: Center(
        //     child: Container(
        //       height: 15.0,
        //       width: 15.0,
        //              decoration: BoxDecoration(
        //                border: Border.all(color:Colors.black, width:1.0),
        //             color: Colors.green,//statusColor[organization.status],
        //             shape: BoxShape.circle),
        //     ),
        //   ),
        // ),
      
      // Container(
      //   height: 80.0,
      //   width: 100.0, // TOD add children requests
      //   child: Center(
      //     child: loggedIn?
      //     Container(
      //        // margin: EdgeInsets.symmetric(vertical: 15),
      //         width:100.0,
      //         child: FlatButton(
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(5)),
      //           color: Colors.grey[300],
      //           onPressed: (){
      //             appState.initClaim(orgData: orgData, requestData: requestData);
      //               tappedMenuButton(context, "/claim");
      //           },
      //           //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      //           child: Text("Make Claim",),
      //         ),
      //       ):
      //     Container(
      //       height: 15.0,
      //       width: 15.0,
      //              decoration: BoxDecoration(
      //                border: Border.all(color:Colors.black, width:1.0),
      //             color: Colors.green,
      //             shape: 
      //             BoxShape.circle
      //             ),
      //     ),
      //   ),
      // ),

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