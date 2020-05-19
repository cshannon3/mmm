import 'package:delaware_makes/utils/utils.dart';
import 'package:flutter/material.dart';
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

// Map userInfo()=>{
//     "id":"userInfo",
//     "isValidated":false,
//     "icon":Icons.person_outline,
//     "h":500.0,
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
//             {"type":"submitButton", "text":"Next"},
//     ]
//     };


// Map orgInfo()=>{
//       "id":"orgInfo",
//       "isValidated":false,
//       "icon":Icons.pin_drop,
//       "h":550.0,
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
//             {"type":"dropdown", "text":"Select From List", "b":20, "items":org, "key":"orgType"},
//             {"type":"submitButton", "text":"Next",},
//     ]
//    };

// Map requestInfo(List designs){
//   Map requests={};
      
//   List items = [{"type":"title", "text":"Request Info"}];
//   designs.forEach((designData) {
//     items.add({
//       "type":"imageInputForm", 
//       "text":safeGet(key: "name", map: designData, alt: ""),
//       "url":safeGet(key: "url", map: designData, alt: ""),
//       "b":20,
//       "key":designData["id"]
//       });
//       requests[designData["id"]]="0";
//   });
//   items.add({"type":"submitButton", "text":"Next",});
// return {
//       "id":"reqInfo",
//       "isValidated":false,
//       "icon":Icons.local_mall,
//       "tooltip":"Requests",
//       "h":500.0,
//       "items":items,
//       "buffer":{"requests":requests}
//    };
// }
// Map deliveryInfo()=>{
//       "id":"deliveryInfo",
//       "isValidated":false,
//       "icon":Icons.verified_user,
//       "h":500.0,
//       "tooltip":"Delivery Instructions",
//       "buffer":{
//         "deliveryInstructions":"",
//       },
//       "items":[
//           {"type":"title", "text":"Delivery Info"},
//           {"type":"description", "text":"Delivery Instructions:", },
//           {"type":"formEntryField", "text":"Delivery Instructions","key": "deliveryInstructions","maxLines":6, "tooltip": "Please enter any information the groups would need to deliver items to you"},
//           {"type":"submitButton", "text":"Submit"},
//         ]
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





//  Widget nextSteps() => Column(children: [
//         formTitle("Next Steps"),
//         SizedBox(
//         height: 10.0,
//       ),
//        formDescription("1. Verification - We will verify your information and approve the requests.",),
//         SizedBox( height:10.0,),
//        formDescription("2. Claim - Users will 'claim' these items. We will share the delivery instructions with them and notify you of their expected delivery time. ",),
//       SizedBox( height:10.0,),
//        formDescription("3. Delivery - The users will drop off the finished items.",),
//             Expanded(child: Container(),),
//                  MainUIButton(
//             onPressed: () {
//                 var platformInfo=locator<PlatformInfo>();
//         setState(() {
//            platformInfo.setOverlay("");
          
//         });
//             },
//             text:"Finish"),
//              SizedBox( height:10.0,),
//       ]);