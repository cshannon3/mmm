//import 'package:flutter/material.dart';



// class FormManager{
//   List<FormModel> forms;
//   Map buffer;
//   FormManager({this.forms});


// }
// const List org = [
//   ""
//   "Hospital",
//   "Senior Living",
//   "Home Care",
//   "Government",
//   "Social Services",
//   "Community Center/Housing",
//   "Rehab",
//   "Physicians/Doctor's Office",
//   "Other"
// ];








 // init(){
    
  // }

  // Widget buildScreen(){
    
  // }

  // _submit(){

  // }




// final Map requestFormData={
//   "screens":[
//         userInfo(),
//        orgInfo(),
//         requestInfo(),
//        deliveryInfo(),
//   ]
// };


// Map userInfo({
//   @required Function() onSubmit, 
//   }
//   )=>{
//     "isValidated":false,
//     "icon":Icons.person_outline,
//     "tooltip":"User Info",
//      "buffer":{
//         "name":"",
//         "email":"",
//     },
//     "items":[
//             {"type":"title", "text":"Contact Info", "b":20},
//             {"type":"description", "text":"Name:"},
//             {"type":"formEntryField", "text":"Name","b":20,"key":"name"},
//             {"type":"description", "text":"Email:"},
//             {"type":"formEntryField", "text":"Email", "b":20,"key":"email"},
//             {"type":"submitButton", "text":"Next","onPressed":onSubmit},
//     ]
//     };
// Map orgInfo({
//   @required Function() onSubmit, 
// })=>{
//       "isValidated":false,
//       "icon":Icons.pin_drop,
//       "tooltip":"Organization Info",
//       "buffer":{
//         "orgName":"",
//         "address":"",
//         "orgType":""
//       },
//       "items":[
//             {"type":"title", "text":"Organization Info"},
//             {"type":"description", "text":"Organization Name:"},
//             {"type":"formEntryField", "text":"Organization Name","b":20,"key":"orgName"},
//             {"type":"description", "text":"Organization Address:"},
//             {"type":"formEntryField", "text":"Organization Address","b":20,"key":"address"},
//             {"type":"description", "text":"Organization Type:"},
//             {"type":"dropDown", "text":"Select From List", "b":20, "items":org, "key":"orgType"},
//             {"type":"submitButton", "text":"Next", "onPressed":onSubmit},
//     ]
//    };
// Map requestInfo()=>{
//       "isValidated":false,
//       "icon":Icons.local_mall,
//        "tooltip":"Requests",
//         "items":[
//             {"type":"title", "text":"Request Info"},
//           ]
//    };
// Map deliveryInfo()=>{
//       "isValidated":false,
//       "icon":Icons.verified_user,
//        "tooltip":"Delivery Instructions",
//         "items":[
//             {"type":"title", "text":"Delivery Info"},
//             {"type":"description", "text":"Delivery Instructions:"},
//             {"type":"formEntryField", "text":"Delivery Instructions","maxLines":6, "tooltip": "Please enter any information the groups would need to deliver items to you"},
//             {"type":"submitButton", "text":"Next"},
//           ]
//    };

// Map loginInfo()=>{
//     "isValidated":false,
//     "icon":Icons.person_outline,
//     "tooltip":"User Info",
//     "items":[
//             {"type":"title", "text":"Sign In"},
//             {"type":"description", "text":"Email:"},
//             {"type":"formEntryField", "text":"Email", "key":"email",},
//             {"type":"description", "text":"Password:"},
//             {"type":"formEntryField", "text":"Password","key":"password"},
//             {"type":"submitButton", "text":"Next"},
//         ]
//     };



           //  DropdownButton(
            //       value: widget.formModel.formData["items"][index]["val"]??0,
            //       items: ite, 
            //       onChanged:(val)=> setState(() 
            //       { widget.formModel.formData["items"][index]["val"]=val;
            //       } 
            //       ));
// Map<String,dynamic> newOrg(){
//       final Map<String, dynamic> map = buffer;
//       String now = DateTime.now().toUtc().toString();
//       Map<String, dynamic>  org = {
//         "id": generateNewID(),
//         "isVerified": false,
//         "contactName": safeGet(key: "contactName", map: map, alt: ""),
//         "contactEmail": safeGet(key: "contactEmail", map: map, alt: ""),
//         "name": safeGet(key: "orgName", map: map, alt: ""),
//         "address": safeGet(key: "address", map: map, alt: ""),
//         "phone": safeGet(key: "phone", map: map, alt: ""),
//         "type": safeGet(key: "type", map: map, alt: ""),
//         "website": safeGet(key: "website", map: map, alt: ""),
//         "lat": safeGet(key: "lat", map: map, alt: null),
//         "lng": safeGet(key: "lng", map: map, alt: null),
//         "deliveryInstructions":safeGet(key: "deliveryInstructions", map: map, alt:""),
//         "createdAt": now,
//         "lastModified": now,
//       };
//       return org;
// }
// Map<String,dynamic> newRequest(Map<String, dynamic> orgData, String designID, int quantity){
//          String now = DateTime.now().toUtc().toString();
//         return {
//           "id": generateNewID(),
//           "orgID": safeGet(key: "id", map: orgData, alt: ""),
//           "designID": designID,
//           "isVerified": false,
//           "contactName": safeGet(key: "contactName", map: orgData, alt: ""),
//           "contactEmail": safeGet(key: "contactEmail", map: orgData, alt: ""),
//           "deliveryInstructions":safeGet(key: "deliveryInstructions", map: orgData, alt: ""),
//           "createdAt": now,
//           "lastModified": now,
//           "requestSource": "website",
//           "quantityRequested": quantity,
//           "quantityRecieved": 0,
//           "quantityClaimed": 0,
//           "isDone": false,
//         };
// }
// Map<String,dynamic> newResource(){
//   final Map<String, dynamic> map = buffer;
//   String now = DateTime.now().toUtc().toString();

//    return  {
//       "id": generateNewID(),
//       "designID": safeGet(key: "designID", map: map,alt: ""),
//       "claimID": safeGet(key: "claimID", map: map, alt: ""),
//       "orgID": safeGet(key: "orgID", map: map, alt: ""),
//       "requestID": safeGet(key: "requestID", map:map, alt: ""),
//       "userID": currentUser["id"],
//       "type": "Update",
//       "quantity": (buffer["quantity"] is String)
//           ? int.tryParse(buffer["quantity"]) ?? 0
//           : buffer["quantity"],
//       "name": safeGet(key: "name", map: map, alt: ""),
//       "url": safeGet(key: "url", map: map, alt: ""),
//       "description": safeGet(key: "description", map:map, alt: ""),
//       "isVerified": false,
//       "createdAt": now,
//       "lastModified": now,
//     };
// }
// Map<String,dynamic> newClaim(){
//   final Map<String, dynamic> map = buffer;
//   String now = DateTime.now().toUtc().toString();
//     Map<String, dynamic> claim = {
//       "id": generateNewID(),
//       "orgID": map["orgData"]["id"],
//       "requestID": map["requestData"]["id"],
//       "designID":map["requestData"]["designID"],
//       "userID": map["id"],
//       "isVerified": false,
//       "quantity": (map["quantity"] is String)
//           ? int.tryParse(buffer["quantity"]) ?? 0
//           : map["quantity"],
//       "createdAt": now,
//       "lastModified": now,
//     };
//     return claim;
// }
// initRequest() {
//     buffer = {
//       "orgName": "",
//       "orgType": "",
//       "requestSource": "website",
//       "requests": {},
//     };
//   }


//   initUpdate({Map claimData}) {
//     if (debug) print("Init Update");
//     buffer = {};
//    // print(claimData);
//     if (claimData != null) {
//       buffer["claimID"] = claimData["id"];
//       buffer["quantity"] = safeGet(key: "quantity", map: claimData, alt: 0);
//       buffer["orgID"] = safeGet(key: "quantity", map: claimData, alt: 0);
//       buffer["designID"] = safeGet(key: "designID", map: claimData, alt: "");
//       buffer["requestID"] = safeGet(key: "requestID", map: claimData, alt: "");
//     }
//   }

//     initClaim({@required Map orgData, @required Map requestData}) {
//     buffer = {};
//     buffer["id"] = generateNewID(); //buffer["userID"]=currentUser.id;
//     buffer["orgData"] = orgData;
//     buffer["requestData"] = requestData;
//   }