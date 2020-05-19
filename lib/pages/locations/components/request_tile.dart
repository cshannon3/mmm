

import 'package:delaware_makes/pages/locations/components/claim_tile.dart';
import 'package:delaware_makes/pages/locations/locations_page.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/utils/utility.dart';
import 'package:flutter/material.dart';



class RequestTile extends StatelessWidget {
  final String requestID;
  final String designID;
  final Function() makeClaim;
  final RequestCounts requestCounts;
  final bool loggedIn;

  RequestTile({Key key, this.requestID,this.designID, this.makeClaim, this.loggedIn=false, this.requestCounts}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    var appState = locator<AppState>();
    Map requestData = appState.dataRepo.getItemByID("requests", requestID, addLinks: true);
    Map designData = appState.dataRepo.getItemByID("designs", designID);
    //print(requestData);

   String designName = safeGet(key:"name", map:designData, alt:"Design");
   bool isDone = safeGet(key:"isDone", map:requestData, alt:false);
    //print(requestData);
    return ExpansionTile(
      title:Row(
        children: <Widget>[
           Text("$designName"),
           requestCounts. isDone?Text(" ", style: TextStyle(fontSize:10.0),)
           :Padding(
             padding: EdgeInsets.all(5.0),
             child:claimButton()//requestCounts.isOpenForUser?updateButton():
           )
        ],
      ),
      trailing: 
      Padding(
          padding: EdgeInsets.all(3.0),
          child: Container(
            decoration: BoxDecoration(
              border:Border.all(
                color:(isDone || requestCounts.isDone)?Colors.green:Colors.red,
                width:2
              ), borderRadius: BorderRadius.circular(10)
            ),
            height: 80.0, width:100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text("Total: ${requestCounts.numRequested}", style: TextStyle(fontSize:10.0),),
              Text("Claimed: ${requestCounts.numClaimed}", style: TextStyle(fontSize:10.0),),
              Text("Remaining: ${requestCounts.numRequested-requestCounts.numClaimed}",style: TextStyle(fontSize:10.0),),
            ],),
          ),
        ),
     children:getClaimTiles(requestData)
      );
  }
  List<Widget> getClaimTiles(Map requestData){
    List<Widget> out =[];
    List claimDataList= safeGet(key:"claims", map:requestData, alt:[]);
   // print(claimDataList);
   // print("CLAIMS");
    claimDataList.forEach((claimID) {
      out.add(ClaimTile(claimID:claimID));
    });
    return out;
     }

     Widget claimButton()=> MaterialButton(
                      height: 40,
                      minWidth: 60.0,
                      onPressed: makeClaim,
                      color: Colors.orangeAccent,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0)),
                      child: Text("Make Claim",
                          style:  TextStyle(color: Colors.white, fontSize: 12.0)),
            );

     Widget updateButton()=> MaterialButton(
                      height: 40,
                      minWidth: 60.0,
                      onPressed: makeClaim,
                      color: Colors.orangeAccent,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0)),
                      child: Text("Update Claim",
                          style:  TextStyle(color: Colors.white, fontSize: 12.0)),
            );
}


    // var claimsCount = safeGet(key: "quantityClaimed", map:requestData, alt:0);
   // bool isDone = reqs[2];

// List getRequestNums(Map data){
//   List reqs = [0,0, true];
//       reqs[0]+=safeGet(key: "quantityRequested", map:data, alt:0);
//     //  reqs[1]+=safeGet(key: "quantityRecieved", map:data, alt:0);
//      reqs[2]=safeGet(key: "isDone", map:data, alt:false);
  
//   return reqs;
// }
// getTotalClaims(Map orgData){

// }


//  int requested=safeGet(key: "quantityRequested", map:requestData, alt:0);

//     List claimDataList= safeGet(key:"claims", map:requestData, alt:[]);
//     int claimed=0;
//     int completed = 0;
//     claimDataList.forEach((c) {
//       Map claimData = appState.dataRepo.getItemByID("claims", c);
//       int cl = safeGet(key: "quantity", map: claimData, alt: 0);
//       claimed += cl;
//       if(safeGet(key: "updateID", map: claimData, alt: "")!=""){
//         completed+=cl;
//       }
//     });
//     bool isDone = (completed>=requested);

// !loggedIn?Tooltip(
//              message: "log in to claim",
//              child: IconButton(
//                onPressed: (){},
//                icon:Icon(Icons.info_outline)
//              ),
//            )
//            :