
import 'package:delaware_makes/forms/form_manager.dart';
import 'package:delaware_makes/pages/locations/map_widget.dart';
import 'package:delaware_makes/pages/locations/components/org_tile.dart';
import 'package:delaware_makes/pages/pages.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/state/data_repo.dart';
import 'package:delaware_makes/utils/utility.dart';

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';
//https://dev.to/happyharis/flutter-web-google-maps-381a
//https://medium.com/funwithflutter/flutter-web-importing-html-and-javascript-flutter-1-9-c728ae9eaf2f
//https://pub.dev/packages/universal_html
//http://kml4earth.appspot.com/icons.html

class MapsPage extends StatefulWidget {

  const MapsPage({Key key,}) : super(key: key);
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
 String activeOrgID;
 bool isFaceShieldOn = true;
 bool isEarSaverOn = true;
 AppState appState;
  String selected = "List";
  FormManager formManager;
  List orgsData;
  AllCounts allCounts;
  

 @override
  void initState() {
    appState = locator<AppState>();
    formManager = locator<FormManager>();
    orgsData = getOrgData();
    allCounts =AllCounts();
    allCounts.init(orgsData, dataRepo: appState.dataRepo);
    formManager.addListener((){
      setState(() {
        orgsData = getOrgData();
        allCounts.init(orgsData, dataRepo: appState.dataRepo);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    orgsData = getOrgData();
    List dropOffData = appState.dataRepo.getItemsWhere("dropoffs");
    List pickUpData = appState.dataRepo.getItemsWhere("pickups");
 
    return
         isMobile(MediaQuery.of(context).size.width) ? 
            Column(
              children: <Widget>[
                mainMyTabs(
                  selected: selected,
                  items: {
                    "List":(){setState(() {
                      selected="List";
                    });},
                    "Map":(){setState(() {
                      selected="Map";
                    });}}
                ),
                selected=="List"?optionsBar(orgsData, dropOffData, pickUpData):mapWidget(orgsData, dropOffData, pickUpData)
              ],
            ) :

              Row(children: [
              mapWidget(orgsData, dropOffData, pickUpData),
              optionsBar(orgsData, dropOffData, pickUpData)
               ],);
  }


  List getOrgData(){

    List res=[];
    List designsIn= [];
    if(isFaceShieldOn)designsIn.add("5f2009e0-55a8-4d4b-aa6a-a9becf5c9392");
    if(isEarSaverOn)designsIn.add("fa900ce5-aae8-4a69-92c3-3605f1c9b494");
    if(designsIn==[])return [];
    List orgs=[];
    try{
         orgs = appState.dataRepo.getItemsWhere("orgs",
         fieldFilters: {"isActive":true  }, 
         getLinkedData:true);
       
    }catch(e){
      print("error");
      }
     orgs?.forEach((org) {
        
      List y =safeGet(key: "requests", map:org, alt:[]);
       bool add = false;
       int i = 0;
       while (i<y.length && !add){
         //bool ver = safeGet(map: y[i], key:"isVerified", alt:false);ver &&
        if( designsIn.contains(y[i]["designID"])){add=true;}
         i++;
       }
       if(add)res.add(org);
      });
    return res;
  }
  List<Widget> getOrgTiles(){
    List<Widget> out =[];
    orgsData.forEach((orgData) {
      out.add(OrgTile(
                orgData:  orgData,
                orgCounts: allCounts.orgCounts[orgData["id"]],
             )
      );
    });
    return out;
  }

Widget optionsBar(List orgsData,List dropOffData,List pickUpData) => Expanded(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            ExpansionTile(
              initiallyExpanded: true,
              title:  Text("Requests",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        decoration: TextDecoration.underline)),
               children: getOrgTiles()
          // orgsData.map((pl) => OrgTile(
          //       orgData:  pl,

          //     ))
         // .toList()
          ),
          ExpansionTile(
              title:  Text("Drop Off Locations",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        decoration: TextDecoration.underline)),
               children: 
          dropOffData.map((pl) => ListTile(
                 title:Column(
                  
                   children: <Widget>[
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                         Text(safeGet(key: "name", map: pl, alt: "Name")),
                         MainUIButton(onPressed: (){}, text: "Schedule Drop Off")
                       ],
                     ),
                     Text("Address: ${safeGet(key: "address", map: pl, alt: "Address")}" ,style: TextStyle(fontSize:12.0),),
                     Text("Accepts: Face Shields, Ear Savers..." ,style: TextStyle(fontSize:12.0),),

                   ],
                 ),
              ))
          .toList()
          ),
            ExpansionTile(
              title:  Text("Pick Up Locations",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        decoration: TextDecoration.underline)),
               children: 
          pickUpData.map((pl) => ListTile(
            title: Text(safeGet(key: "name", map: pl, alt: "Name")),
          ))
          .toList()
          ),

          ]),
        ),
      );
  Widget mapWidget(List orgsData,List dropOffData,List pickUpData) =>Expanded(child: 
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(height: 80.0,width: 300.0,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Column(
            children: <Widget>[
              Checkbox(
                value: isFaceShieldOn,
                onChanged: (value) {
                    isFaceShieldOn = value;
                    orgsData = getOrgData();
                  setState(() { }
                  );
  },// activeTrackColor: Colors.lightGreenAccent, 
  activeColor: Colors.green,
),
   Text("Face Shields"),
            ],
          ),
          SizedBox(width:20.0),
Column(
  children: <Widget>[
        Checkbox(
      value: isEarSaverOn,
      onChanged: (value) {
         isEarSaverOn = value;
         orgsData = getOrgData();
        setState(() {
         
         
        //allCounts.init(orgsData, dataRepo: appState.dataRepo);
        });
      },
     
      activeColor: Colors.green,
    ),
    Text("Ear Savers"),
  ],
),
 SizedBox(width:20.0),
        ]
      )),
      Container(
                height: 500.0,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(60.0)),
                clipBehavior: Clip.antiAlias,
                child:
                     GoogleMap(orgsData: orgsData,dropOffData: dropOffData, pickupData: pickUpData,),
                  ),
    ],
  )
      );
}

class AllCounts {
  int totalRequests=0;
  int totalClaims=0;
  int totalDelivered=0;
  Map<String,OrgCounts> orgCounts={};
  Map<String, DesignCount> designsCount={};

  AllCounts();
  init(List orgDataList, {String currentUserID, DataRepo dataRepo}){
    orgDataList.forEach((orgData) {
      OrgCounts c = OrgCounts();
      c.init(orgData, dataRepo:dataRepo);
      orgCounts[orgData["id"]]=c;
      //c.designsCount.forEach((key, value) {
        //if(!designsCount.containsKey(key))designsCount[key]= DesignCount();
       // designsCount[key].add(value);
      //});
    });
  }
}

class OrgCounts {
  int totalRequests=0;
  int totalClaims=0;
  int totalDelivered=0;
  Map<String, RequestCounts> requestCounts={};
  Map<String, DesignCount> designsCount={};
  bool isDone=false;
  OrgCounts();

  init(Map orgData, {String currentUserID, DataRepo dataRepo}){
    isDone=true; //isOpenForUser=false;
      totalRequests=0;
     totalClaims=0;
     totalDelivered=0;
     requestCounts={};
     if(orgData.containsKey("requests")){
        orgData["requests"].forEach((reqData){
          RequestCounts c = RequestCounts();
          c.init(reqData,orgData["claims"],currentUserID: currentUserID , dataRepo:dataRepo);
          requestCounts[reqData["id"]]=c;
          totalClaims+=c.numClaimed;
          totalDelivered+=c.numDelivered;
          totalRequests+=c.numRequested; //  if(c.isOpenForUser){isOpenForUser=true;}
       });
     }
     if(totalDelivered<totalRequests)isDone=false;}
}

class RequestCounts{
  String id;
  int numRequested=0;
  int numClaimed=0;
  int numDelivered=0;//bool isOpenForUser=false;
  bool isDone = false;
  Map<String, DesignCount> designsCount={};

  RequestCounts();
  init(Map requestData, List claims, {String currentUserID, DataRepo dataRepo}){ //isOpenForUser=false;
    id = safeGet(key: "id", map:requestData, alt:"");
    String designID = safeGet(key: "designID", map:requestData, alt:"");
    if(designID != "" && designsCount.containsKey(designID)){
      designsCount[designID]=DesignCount();
    }
    numRequested = safeGet(key: "quantityRequested", map:requestData, alt:0);
    //designsCount[designID].numClaimed+=numRequested;
    claims.forEach((claim) {
        if(id == safeGet(key: "requestID", map:claim, alt:"")){
          int cl = safeGet(key: "quantity", map: claim, alt: 0);
          numClaimed+=cl;
          //designsCount[designID].numClaimed+=cl;
          Map claimData= dataRepo.getItemByID("claims", claim["id"], addLinks: true);
          if(claimData["resources"].length !=0){
              isDone = true;
             numDelivered+=cl;
            // designsCount[designID].numDelivered+=cl;
            }}
    });
    isDone = (numDelivered>=numRequested);
  }
}

class DesignCount{
  String designID;
  int numRequested=0;
  int numClaimed=0;
  int numDelivered=0;
  DesignCount();

  add(DesignCount c){
    numRequested+=c.numRequested;
    numClaimed+=c.numClaimed;
    numDelivered+=c.numDelivered;
  }
}
