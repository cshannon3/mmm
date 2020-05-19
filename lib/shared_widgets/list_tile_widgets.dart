
// import 'package:delaware_makes/pages/locations/locations_utils.dart';
// import 'package:delaware_makes/routes.dart';
// import 'package:delaware_makes/service_locator.dart';
// import 'package:delaware_makes/state/app_state.dart';
// import 'package:delaware_makes/utils/utility.dart';
// import 'package:flutter/material.dart';

// class LocationsTile extends StatelessWidget {
//   final List<Widget> children;
//   final Widget leading;
//   final Widget title;
//   final Widget trailing;
//   final String titleText;

//   const LocationsTile({
//     Key key, 
//     this.leading, 
//     this.title, 
//     this.trailing, 
//     this.titleText, 
//     this.children
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }

// class OrgTile extends StatelessWidget {
//   final Map orgData;
//   OrgTile({
//     Key key,
//     @required this.orgData,
//   });
//   AppState appState;

//   List<Widget> getRequestTiles(BuildContext context){
//     List<Widget> out =[];
//     List requestDataList= safeGet(key:"requests", map:orgData, alt:[]);
//     requestDataList.forEach((requestData) {
//       out.add(requestTile(requestData, context));
//     });
//     return out;
//   }
//   Widget requestTile(Map requestData, BuildContext context){
    
//     bool loggedIn = appState.loggedIn;
//     requestData= appState.dataRepo.addLinkedData("requests", requestData["id"], requestData);
//     Map designData =appState.getItemByID("designs", requestData["designID"]);
//     String designName = safeGet(key:"name", map:designData, alt:"Design");
//     List reqs= getRequestNums(requestData);
//     var claimsCount = safeGet(key: "quantityClaimed", map:requestData, alt:0);
//     bool isDone = reqs[2];

//  return ExpansionTile(
//       title:Row(
//         children: <Widget>[
//            Text("$designName"),
//            isDone?Text("   completed", style: TextStyle(fontSize:10.0),)
//            :!loggedIn?Tooltip(
//              message: "log in to claim",
//              child: IconButton(
//                onPressed: (){},
//                icon:Icon(Icons.info_outline)
//               //    
                
//              ),
//            )
//            :Padding(
//              padding: EdgeInsets.all(5.0),
//              child: MaterialButton(
//                       height: 40,
//                       minWidth: 60.0,
//                       onPressed: (){
//                         appState.initClaim(orgData: orgData, requestData: requestData);
//                         tappedMenuButton(context, "/claim");
//                       },
//                       color: Colors.orangeAccent,
//                       textColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: new BorderRadius.circular(18.0)),
//                       child: Text("Make Claim",
//                           style:  TextStyle(color: Colors.white, fontSize: 12.0)),
//             ),
//            )
//         ],
//       ),
//       trailing: 
//       Padding(
//           padding: EdgeInsets.all(3.0),
//           child: Container(
//             decoration: BoxDecoration(
//               border:Border.all(
//                 color:reqs[2]?Colors.green:Colors.red,
//                 width:2
//               ), borderRadius: BorderRadius.circular(10)
//             ),
//             height: 80.0, width:100.0,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//               Text("Total: ${reqs[0]}", style: TextStyle(fontSize:10.0),),
//               Text("Claimed: $claimsCount", style: TextStyle(fontSize:10.0),),
//               Text("Remaining: ${reqs[0]-reqs[1]}",style: TextStyle(fontSize:10.0),),
//             ],),
//           ),
//         ),
//      children:getClaimTiles(requestData)
//       );
//   }
//   List<Widget> getClaimTiles(Map requestData){
//     List<Widget> out =[];

//     List claimDataList= safeGet(key:"claims", map:requestData, alt:[]);
//     claimDataList.forEach((claimData) {
//       out.add(claimTile(claimData));
//     });
//     return out;
//      }
//   Widget claimTile(Map claimData){
//     Map userData = appState.getItemByID("users", claimData["userID"]);
//     String userName = safeGet(key:"displayName", map:userData, alt:"User");
//     return ListTile(
//       title: Text("$userName claimed ${safeGet(key:"quantity", map:claimData, alt:0)}"),
//       trailing: Container(
//         height: 50.0,
//         width: 50.0,   // TOD add children requests
//         child: Center(
//           child: Container(
//             height: 15.0,
//             width: 15.0,
//                    decoration: BoxDecoration(
//                      border: Border.all(color:Colors.black, width:1.0),
//                   color: Colors.green,
//                   shape: BoxShape.circle),
//           ),
//         ),
//       ),
//       );
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     appState=  locator<AppState>();
//     List reqs = getTotalRequests(orgData);
//     return  Padding(
//       padding: const EdgeInsets.only(left:25.0),
//       child: ExpansionTile(
//         title: Text(safeGet(key:"name", map:orgData, alt:"")),
//         trailing: Padding(
//           padding: EdgeInsets.all(3.0),
//           child: Container(
//             decoration: BoxDecoration(
//               border:Border.all(
//                 color:reqs[2]?Colors.green:Colors.red,
//                 width:2
//               ),
//               borderRadius: BorderRadius.circular(10)
//             ),
//             height: 80.0,
//             width:100.0,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//               Text("Total: ${reqs[0]}", style: TextStyle(fontSize:10.0),),
//               Text("Remaining: ${reqs[0]-reqs[1]}",style: TextStyle(fontSize:10.0),),
//             ],),
//           ),
//         ),
//         children: getRequestTiles(context)
//         ),
//     );
//   }
// }

