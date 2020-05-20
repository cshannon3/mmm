

import 'package:delaware_makes/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:delaware_makes/utils/utils.dart';


class FormModel{
  double h;
  bool isCompleted=false;
  bool showIconBar =true;
  bool validate=true;
  IconData icon=Icons.people;
  String tip="";
  Widget screen;
  Map formData={};
  Function(bool) onCompleted;
  var formKey;//= GlobalKey<FormState>();
  FormModel({this.formData, this.h, this.tip,this.icon, this.showIconBar=true, this.validate=false });
  
  setKey(String key, dynamic val){formData["buffer"][key]=val;}
  dynamic getVal(String key)=>formData["buffer"][key];
}

    Widget padForm(Widget widget, {double h = 400}) => Center(
    child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        width: 400.0,
        height: h,
        child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: widget)));

const List org = [
  ""
  "Hospital",
  "Senior Living",
  "Home Care",
  "Government",
  "Social Services",
  "Community Center/Housing",
  "Rehab",
  "Physicians/Doctor's Office",
  "Other"
];

Map userInfo()=>{
    "id":"userInfo",
    "isValidated":false,
    "formKey": "",
    "icon":Icons.person_outline,
    "h":500.0,
    "tooltip":"User Info",
     "buffer":{
        "name":"",
        "email":"",
    },
    "items":[
            {"type":"title", "text":"Contact Info", "b":20},
            {"type":"description", "text":"Name:"},
            {"type":"formEntryField", "text":"Name","b":20,"key":"name"},
            {"type":"description", "text":"Email:"},
            {"type":"formEntryField", "text":"Email", "b":20,"key":"email"},
             {"type":"expanded", },
            {"type":"submitButton", "text":"Next"},
    ]
    };


Map orgInfo()=>{
      "id":"orgInfo",
      "isValidated":false,
      "formKey":  "",
      "icon":Icons.pin_drop,
      "h":550.0,
      "tooltip":"Organization Info",
      "buffer":{
        "orgName":"",
        "address":"",
        "orgType":""
      },
      "items":[
            {"type":"title", "text":"Organization Info"},
            {"type":"description", "text":"Organization Name:"},
            {"type":"formEntryField", "text":"Organization Name","b":20,"key":"orgName"},
            {"type":"description", "text":"Organization Address:"},
            {"type":"formEntryField", "text":"Organization Address","b":20,"key":"address"},
            {"type":"description", "text":"Organization Type:"},
            {"type":"dropdown", "text":"Select From List", "b":20, "items":org, "key":"orgType"},
            {"type":"expanded", },
            {"type":"submitButton", "text":"Next",},
    ]
   };

Map requestInfo(List designs){
  Map requests={};
  List items = [{"type":"title", "text":"Request Info"}];
  designs.forEach((designData) {
    items.add({
      "type":"imageInputForm", 
      "text":safeGet(key: "name", map: designData, alt: ""),
      "url":safeGet(key: "url", map: designData, alt: ""),
      "b":20,
      "key":designData["id"]
      });
      requests[designData["id"]]="0";
  });
  items.add({"type":"submitButton", "text":"Next",});
  return {
      "id":"reqInfo",
      "isValidated":false,
      "formKey": "",
      "icon":Icons.local_mall,
      "tooltip":"Requests",
      "h":500.0,
      "items":items,
      "buffer":{
        "requests":requests
      }
   };
}
Map deliveryInfo()=>{
      "id":"deliveryInfo",
      "isValidated":false,
      "icon":Icons.verified_user,
      "formKey": "",
      "h":500.0,
      "tooltip":"Delivery Instructions",
      "buffer":{
        "deliveryInstructions":"",
      },
      "items":[
          {"type":"title", "text":"Delivery Info"},
          {"type":"description", "text":"Delivery Instructions:", },
          {"type":"formEntryField", "text":"Delivery Instructions","key": "deliveryInstructions","maxLines":6, "tooltip": "Please enter any information the groups would need to deliver items to you"},
           {"type":"expanded", },
          {"type":"submitButton", "text":"Submit"},
        ]
   };

Map loginInfo()=>{
    "isValidated":false,
    "icon":Icons.person_outline,
    "tooltip":"User Info",
         "buffer":{
        "verification":"",
        "quantity":"",
    },
    "items":[
            {"type":"title", "text":"Sign In"},
            {"type":"description", "text":"Email:"},
            {"type":"formEntryField", "text":"Email", "key":"email",},
            {"type":"description", "text":"Password:"},
            {"type":"formEntryField", "text":"Password","key":"password"},
            {"type":"submitButton", "text":"Submit"},
        ]
    };

Map claimInfo(Map buffer){
  print(buffer);
 return  {
    "id":"claimInfo",
    "icon":Icons.info_outline,
    "h":600.0,
    "tooltip":"Claim Info",
     "buffer":{
      "TESE":"TEKDKSA                            CSRAFVESR"
    },
    "items":[
            {"type":"title", "text":"Claim Overview", "b":20},
            {"type":"description", "text":"Organization: ${safeGet(key: "name", map: buffer["orgData"], alt: "-")}"},
            {"type":"description", "text":"Design: ${safeGet(key: "name", map: buffer["designData"], alt: "-")}"},
            {"type":"image", "url":"${safeGet(key: "url", map: buffer["designData"], alt: "")}"},
            {"type":"description", "text":"Quantity Remaining:${safeGet(key: "maxQuantity", map: buffer, alt: "")} "},
            {"type":"expanded", },
            {"type":"submitButton", "b":20, "text":"Next"},
    ]
    };
}
Map claimVer(Map buffer)=>{
    "id":"claimVer",
    "icon":Icons.person_outline,
    "h":550.0,
    "tooltip":"Claim Info",
     "buffer":{
        "name":"",
        "verification":"",
        "quantity":"",
    },
    "items":[
            {"type":"title", "text":"Claim Information", "b":20},
            {"type":"description", "text":"Name:"},
            {"type":"formEntryField", "text":"Name","b":20,"key":"name"},
            {"type":"description", "text":"Quantity Claiming:"},
            {"type":"formEntryField", "text":"quantity", "b":20,"key":"quantity"},
            {"type":"description", "text":"Verification Code:", "tooltip":" If you don’t have a verification code, request one by emailing delawaremakes@gmail.com"},
            {"type":"formEntryField", "text":"Verification Code","b":20,"key":"verification", "validator":"verification"},
            {"type":"expanded", },
            {"type":"submitButton", "b":20, "text":"Submit"},
    ]
    };
Map claimReview(Map buffer)=>{
    "id":"claimVer",
    "icon":Icons.person_outline,
    "h":550.0,
    "tooltip":"Claim Info",
     "buffer":{
    },
    "items":[
            {"type":"title", "text":"Claim Review", "b":20},
            {"type":"description", "text":"Name:"},
            {"type":"formEntryField", "text":"Name","b":20,"key":"name"},
            {"type":"description", "text":"Quantity Claiming:"},
            {"type":"formEntryField", "text":"quantity", "b":20,"key":"quantity"},
            {"type":"description", "text":"Verification Code:", "tooltip":" If you don’t have a verification code, request one by emailing delawaremakes@gmail.com"},
            {"type":"formEntryField", "text":"Verification Code","b":20,"key":"verification", "validator":"verification"},
            {"type":"expanded", },
            {"type":"submitButton", "b":20, "text":"Done"},
    ]
    };
Map updateInfo()=>{
    "id":"updateInfo",
    "isValidated":false,
    "icon":Icons.person_outline,
    "h":700.0,
    "tooltip":"Update Info",
     "buffer":{
        "verification":"",
        "name":"",
        "url":"",
        "isActive":false
    },
    "items":[
            {"type":"title", "text":"Update", "b":20},
            {"type":"description", "text":"Name:"},
            {"type":"formEntryField", "text":"Name","key":"name"},
            {"type":"description", "text":"Verification Code:", "tooltip":" If you don’t have a verification code, request one by emailing delawaremakes@gmail.com"},
            {"type":"formEntryField", "text":"Verification Code","b":20,"key":"verification","validator":"verification"},
            {"type":"imageUpload", "text":"Upload", "b":20,"key":"url"},
            {"type":"expanded", },
            {"type":"submitButton", "b":20, "text":"Submit"},
      ]
    };
Map materialRequestInfo()=>{
    "id":"materialInfo",
    "isValidated":false,
    "icon":Icons.info_outline,
    "h":500.0,
    "tooltip":"Request Info",
     "buffer":{
        "info":"",
        "quantity":"",
    },
    "items":[
            {"type":"title", "text":"Claim Information", "b":20},
            {"type":"description", "text":"Who are you making the shields for:", "tooltip":"Please enter any information the groups would need to deliver items to you"},
            {"type":"formEntryField", "text":"End User Information","b":20,"key":"info", "maxlines":3},
            {"type":"description", "text":"Approximately How Many are Needed?"},
            {"type":"formEntryField", "text":"quantity", "b":20,"key":"quantity", "validator":"int"},
            {"type":"submitButton", "text":"Next"},
    ]
    };


Map nextSteps({@required List<String> steps}){
   List items = [{"type":"title", "text":"Request Info"}];
   for (int i =0; i<steps.length; i++){
     items.add({"type":"description", "text":"$i. ${steps[i]}"});
   }
    items.add({"type":"expanded", });
   items.add({"type":"submitButton", "b":20.0,"text":"Next"});
   return {
    "type":"info",
    "buffer":{
       
    },
    "items":items
    };
}




// Map claimReview()=>{
//     "id":"claimReview",
//     "isValidated":false,
//     "icon":Icons.person_outline,
//     "h":500.0,
//     "tooltip":"Claim Review",
//      "buffer":{
//     },
//     "items":[
//             {"type":"title", "text":"Claim Information", "b":20},
//             {"type":"description", "text":"Verification Code:", "tooltip":" If you don’t have a verification code, request one by emailing delawaremakes@gmail.com"},
//             {"type":"formEntryField", "text":"Verification Code","b":20,"key":"verification"},
//             {"type":"description", "text":"Quantity Claiming:"},
//             {"type":"formEntryField", "text":"quantity", "b":20,"key":"quantity"},
//             {"type":"submitButton", "text":"Next"},
//     ]
//     };
//  validator: (val)=>!validateEmail(val)?'Please enter email correctly':null,

// initRequestMaterial() {
//     buffer = {
      
//     };
//   }

// submitRequestMaterial() async {
//     String now = DateTime.now().toUtc().toString();
//      buffer["createdAt"]=now;
//     final Map<String, dynamic> map = buffer;
//     dataRepo.addRowToSheet(vals: materialToSheet(map), sheetName: "Material");
//   }

// initUpdate({Map claimData}) {
//     if (debug) print("Init Update");
//     buffer = {};// print(claimData);
//     if (claimData != null) {
//       buffer["claimID"] = claimData["id"];
//       buffer["quantity"] = safeGet(key: "quantity", map: claimData, alt: 0);
//       buffer["orgID"] = safeGet(key: "quantity", map: claimData, alt: 0);
//       buffer["designID"] = safeGet(key: "designID", map: claimData, alt: "");
//       buffer["requestID"] = safeGet(key: "requestID", map: claimData, alt: "");
//     }
//   }

//   initClaim({@required Map orgData, @required Map requestData}) {
//     buffer = {};
//     buffer["id"] = generateNewID(); 
//     buffer["userID"]=safeGet(key: "id", map: currentUser, alt: "");
//     buffer["orgData"] = orgData;
//     buffer["requestData"] = requestData;
// }

  // initRequest() {
  //   buffer = {
  //     "orgName": "",
  //     "orgType": "",
  //     "requestSource": "website",
  //     "requests": {},
  //   };
  // }

//   Future<String> submitRequest(Map data) async {
//     final Map reqs = data["requests"];
//     print(reqs);
//     String userID = (currentUser == null) ? "" : currentUser["id"];
//     Map<String, dynamic> reqOrg = {};
//     bool isNewOrg = false;
//     if (data.containsKey("orgID")) {
//       reqOrg = await dataRepo.getModelFromFirestore(modelID: data["orgID"], collectionName: "orgs");
//       //reqOrg["isActive"] = true;
//     } else {
//       reqOrg = newOrg(data);
//       if(userID!="")reqOrg["userID"] = userID;
//        isNewOrg = true;
//       print(newOrg);
//     }
//     List reqData=[];
//     reqs.forEach((designID, quantity) {
//       if (quantity != 0) {
//         Map<String, dynamic> requestData = newRequest(reqOrg, designID, quantity);
//         if(userID!="")requestData["userID"] = userID;
//       reqData.add(requestData);
//       }});// CREATE REQUEST
//       print(reqData);
//        for( int i= 0; i<reqData.length;i++){
//             await  dataRepo.createModel(modelData: reqData[i], collectionName: "requests");
//             dataRepo.addRowToSheet(collectionName:"requests", vals:requestToSheet(reqData[i]));  
//         }
//       if(isNewOrg){
//            await  dataRepo.createModel(modelData: reqOrg, collectionName: "orgs");
//            dataRepo.addRowToSheet(collectionName:"orgs", vals:orgToSheet(reqOrg));
//        }
//     await Future.delayed(Duration(milliseconds: 10));

//     return "";

//   }



//   Future<String> submitUpdate(Map<String, dynamic> map) async {
//     Map<String, dynamic> resourceData = newResource(map);
//     await dataRepo.createModel(modelData: resourceData, collectionName: "resources");
//     dataRepo.addRowToSheet(collectionName:"resources", vals:resourceToSheet(resourceData));
//     //if (resourceData["claimID"] != "") {
//      // print("claim");
//       //Update claim w/ resource ID
//     //   await dataRepo.updateModelValue(
//     //       modelID: resourceData["claimID"],
//     //       collectionName: "claims",
//     //       fieldName: "isDone",
//     //       newVal: true);
//     // }
//     //await Future.delayed(Duration(milliseconds: 50));
//    // isReady = false;
//   //  notifyListeners();
//     return "";
//   }

//   Future<String> submitClaim(Map<String, dynamic> map) async {
//     print("SUBMIT CLAIM");
//     Map<String, dynamic> claim = newClaim(map);
//     print(claim);
//     await dataRepo.createModel(modelData: claim, collectionName: "claims");
//     dataRepo.addRowToSheet(collectionName:"claims", vals:claimToSheet(claim));
//    // isReady = false;
//    // notifyListeners();
//     return "";
//   }

// // Map<String,dynamic> newUser(){
  
// // }
