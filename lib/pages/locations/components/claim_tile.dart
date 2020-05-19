import 'package:delaware_makes/forms/form_manager.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/image_widgets.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/utils/utility.dart';
import 'package:flutter/material.dart';

class ClaimTile extends StatelessWidget {
  final String claimID;

  const ClaimTile({Key key, this.claimID}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var appState = locator<AppState>();
    Map claimData= appState.dataRepo.getItemByID("claims", claimID, addLinks: true);

    Map userData = appState.dataRepo.getItemByID("users", safeGet(key:"userID", map:claimData, alt:{})); 
    Map groupData = appState.dataRepo.getItemByID("groups", safeGet(key:"groupID", map:claimData, alt:""));
    //print(safeGet(key:"groupID", map:claimData, alt:""));
    bool isDone = false;
    Map resourceData ={};
    String type, url;
    if(claimData["resources"].length !=0){
      isDone = true;
      resourceData= appState.dataRepo.getItemByID("resources", claimData["resources"][0]);
     // print(resourceData);
      type= safeGet(key: "type", map: resourceData, alt: "");
      url= safeGet(key: "url", map: resourceData, alt: "");
    }
    String userName = safeGet(key:"name", map:userData, alt:"User");
    if(userName=="User"){
      userName = safeGet(key:"userName", map:claimData, alt:"User");
    }
    String groupName = safeGet(key:"name", map:groupData, alt:"");
   
    print(groupName);
    return ListTile(
      title:Column(
        
        children: <Widget>[
          Row(
            children: <Widget>[
                   isDone?Text("$userName delivered ${safeGet(key:"quantity", map:claimData, alt:0)}"):
                   Text("$userName claimed ${safeGet(key:"quantity", map:claimData, alt:0)}"),
                   Expanded(child: Container(),)
            ],
          ),
          Row(
            children: <Widget>[
              Text(groupName, style: TextStyle(fontSize:14.0, color: Colors.blue),),
              Expanded(child: Container(),)
            ],
          ),
         
          (isDone && type=="Update" && url!="")?
          Center(
            child: Container(
              height: 200.0,
              width: 200.0,
              child: StylizedImageBox(url: url)
            ),
          ):SizedBox()
        ],
      ),
      trailing: isDone?Icon(Icons.done, color: Colors.green,):Padding(
             padding: EdgeInsets.all(5.0),
             child:updateButton(claimData)
           )
       
      );
  }

   Widget updateButton(Map claimData)=> MaterialButton(
                      height: 40,
                      minWidth: 60.0,
                      onPressed: (){
                        var formManager = locator<FormManager>();
                        formManager.initUpdate(claimData:claimData);
                        formManager.setForm("update", resetBuffer: false);
                        formManager.n();
                      },
                      color: Colors.orangeAccent,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0)),
                      child: Text("Update Claim",
                          style:  TextStyle(color: Colors.white, fontSize: 12.0)),
            );
}


    // print(claimData);
    // print("RESOURCES");
    // print(claimData["resources"]);
    // print(claimData["resources"].length);

    // print(claimData["resources"].length !=0);
    // print(claimID);
        // Row(
            // children: <Widget>[
       // ],
         //  ),
          //  isDone?Align(alignment: Alignment.centerRight,child: Icon(Icons.done, color: Colors.green,),)
          //  :Padding(
          //    padding: EdgeInsets.all(5.0),
          //    child:updateButton(claimData)
          //  )
      // trailing: Container(
      //   height: 50.0,
      //   width: 50.0,   // TOD add children requests
      //   child: Center(
      //     child: Container(
      //       height: 15.0,
      //       width: 15.0,
      //              decoration: BoxDecoration(
      //                border: Border.all(color:Colors.black, width:1.0),
      //             color:  isDone? Colors.green:Colors.yellow,
      //             shape: BoxShape.circle
      //             ),
      //     ),
      //   ),
      // ),