// import 'package:delaware_makes/routes.dart';
// import 'package:delaware_makes/service_locator.dart';
// import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
// import 'package:delaware_makes/state/app_state.dart';
// import 'package:delaware_makes/state/platform_state.dart';
// import 'package:delaware_makes/utils/utility.dart';
// import 'package:flutter/material.dart';
// import 'package:delaware_makes/extensions/hover_extension.dart';

// //import 'package:google_maps_webservice/places.dart';
// //https://medium.com/flutter-community/realistic-forms-in-flutter-part-1-327929dfd6fd

// //    formTitle("New Request Form", underline: true),

// //https://pub.dev/packages/flutter_google_places#-example-tab-
// //https://pub.dev/packages/google_maps_webservice#-installing-tab-
// //https://github.com/icemanbsi/searchable_dropdown/blob/master/example/lib/main.dart

// // final places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

// class MaterialRequestPage extends StatefulWidget {
//   MaterialRequestPage({
//     Key key,
//   }) : super(key: key);

//   @override
//   _MaterialRequestPageState createState() => _MaterialRequestPageState();
// }




// class _MaterialRequestPageState extends State<MaterialRequestPage> {
//   AppState appstate;
//   CustomLoader loader; // List<String> req = [];
//   bool loggedIn = false;
//   bool orgFound;

//   List screens = [false, false];
//   List icons = [  Icons.person_outline,  Icons.pin_drop,];
//   List tips = [  "User Info", "Request Info"];
//   List screenWidgets;
//   int currentScreenNum = 0;
//   var _userFormKey = GlobalKey<FormState>();
//   var _infoFormKey = GlobalKey<FormState>();

//   List orgsList;
//   @override
//   void initState() {

//     appstate = locator<AppState>();
//     appstate.initRequestMaterial();
//     if (appstate.currentUser != null) {
//       appstate.buffer["userID"] = appstate.currentUser["id"];
//       appstate.buffer["contactName"] = appstate.currentUser["name"];
//       appstate.buffer["contactEmail"] = appstate.currentUser["email"];

//       screens[0] = true;
//       currentScreenNum = 1;
//     }
//     loader = CustomLoader();
//     super.initState();
//   }

//   void _submitForm() {
//     loader.showLoader(context);
//     appstate.submitRequestMaterial().then((status) {}).whenComplete(
//       () {
//         loader.hideLoader();
//        setState(() {
//           screens[1] = true;
//           currentScreenNum += 1;
//         });
//       },
//     );
//   }

//   Widget padForm(Widget widget, {double h = 400}) => Center(
//       child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(5.0)),
//           ),
//           width: 400.0,
//           height: h,
//           child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//               child: widget)));

//   Widget userInfoForm() {
//     return Container(  
//         child: Form(
//           key: _userFormKey,
//         child: Column(
//           children: <Widget>[
//             formTitle("Contact Info"),
//             SizedBox(
//               height: 10.0,
//             ),
//             formDescription("Name"),
//             formEntryField(
//               initVal:  safeGet(key:"contactName", map:appstate.buffer, alt:""),
//                 labelText: 'Name',
//                 hint: 'Enter Name',
//                 onChange: (val) =>
//                     setState(() => appstate.buffer["contactName"] = val),
//                   ),
//             SizedBox( height: 40.0, ),
//             formDescription("Email"),
//             formEntryField(
//               initVal:  safeGet(key:"contactEmail", map:appstate.buffer, alt:""),
//                 labelText: 'Email',
//                 validator: (val)=>!validateEmail(val)?'Please enter email correctly':null,
//                 hint: 'Enter Email',
//                 onChange: (val) =>
//                     setState(() => appstate.buffer["contactEmail"] = val)),
//             Expanded(child: Container(),),
//               MainUIButton(
//             onPressed: () {
//                 // verify
//                 if (_userFormKey.currentState.validate()) {
//                   _userFormKey.currentState.save();
//                   setState(() {
//                   screens[0] = true;
//                   currentScreenNum += 1;
//                 }); 
//                 }
//               },
//             text:"Next"),
//             SizedBox( height:10.0, ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget infoForm() => Container(  
//         child: Form(
//           key: _infoFormKey,
//       child: Column(children: [
//             formTitle("Request Information"),
//             SizedBox(
//             height: 21.0,
//           ),
//            formDescription("Who are you making the shields for:", tooltip: "Please enter any information the groups would need to deliver items to you"),
//           formEntryField(
//             maxLines: 3,
//               labelText: 'End User Information',
//               onChange: (val) => setState(() => appstate.buffer["info"] = val)),
               
//               formDescription("Approximately How Many are Needed?", tooltip: ""),
//             formEntryField(
//               labelText: 'Quantity',
//               onChange: (val) {
//                  print(val);
//                         int v = int.tryParse(val);
//                         print(val);
//                         if (v != null) {
//                           setState(() {
//                 appstate.buffer["quantity"] = v;
//                           });}
//               },),
//                 Expanded(child: Container(),),
//                      MainUIButton(
//                 onPressed: () {
//                   if (_infoFormKey.currentState.validate()) {
//                  _infoFormKey.currentState.save();
//                     _submitForm();
                  
//                   }
//                 },
//                 text:"Next"),
//                  SizedBox( height:10.0,),
//           ]),
//     ),
//   );
//   Widget nextSteps() => Column(children: [
//         formTitle("Next Steps"),
//         SizedBox(
//         height: 10.0,
//       ),
//        formDescription("1. Verification - We will verify your information and approve the requests.",),
// SizedBox( height:10.0,),
//        formDescription("2. Contact - We will get in contact with you soon to figure out how to get these materials to you",),
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

//   Widget iconButton(int itemNum){
//         bool current = itemNum==currentScreenNum;
//         bool done = screens[itemNum];
//       return  Container(
//           decoration: BoxDecoration(
//           border: Border.all(color:current?Colors.blue:done?Colors.green:Colors.grey, width: 2.0),
//             shape:BoxShape.circle
//             ),
//           child:Tooltip(
//             message: tips[itemNum],
//             child: Padding(
//               padding: EdgeInsets.all(3.0),
//               child: IconButton(
//                 onPressed: (){
//                   bool isAvailable=true;
//                   for (int i = 0;i<itemNum; i++){
//                     if(!screens[i])isAvailable=false;
//                   }
//                   if(isAvailable)
//                   setState(() {
//                     currentScreenNum=itemNum;
//                   });
//                 },
//                 icon: Icon(icons[itemNum], color: done?Colors.green:Colors.grey,)),
//             ),
//           )).showCursorOnHover.moveUpOnHover;
//   }    

//   Widget progressRow()=>Container(
//        decoration: BoxDecoration(
//             color: Colors.white,//.withOpacity(0.9),
//             borderRadius: BorderRadius.all(Radius.circular(50.0)),
//           ),
//     width: 400.0,
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           iconButton(0),
//           iconButton(1),
//         ],
//       ),
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     screenWidgets = [
//       padForm(userInfoForm(),  h: 450.0),
//       padForm(infoForm(), h:450.0),
//       padForm(nextSteps(), h:450.0)
//     ];
//     return Container(
//       width: 400.0,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children:[
//            progressRow(),
//             SizedBox( height: 10.0, ),
//             screenWidgets[currentScreenNum]
//         ]),
//     );
//   }
// }







//   // List<FormModel> formScreens= [
//   //   FormModel(icon:Icons.person_outline, tip: "User Info"),
//   //   FormModel(icon:Icons.pin_drop, tip: "Request Info"),

//   // ];