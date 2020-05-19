// import 'package:delaware_makes/forms/form_manager.dart';
// import 'package:delaware_makes/service_locator.dart';
// import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
// import 'package:delaware_makes/state/app_state.dart';
// import 'package:delaware_makes/state/form_state.dart';
// import 'package:delaware_makes/state/platform_state.dart';
// import 'package:delaware_makes/utils/constant.dart';
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







// class RequestPage extends StatefulWidget {
//   RequestPage({
//     Key key,
//   }) : super(key: key);

//   @override
//   _RequestPageState createState() => _RequestPageState();
// }

// class _RequestPageState extends State<RequestPage> {
//   AppState appstate;
//   CustomLoader loader; // List<String> req = [];
//   bool loggedIn = false;
//   bool orgFound;
//   FormManager formManager;

//      // int currentScreenNum = 0;
//     // List<FormModel> formScreens;
//    // List<int> orders = [0, 0];
//   // updateVal(String key, String val) =>setState(() => appstate.buffer[key] = val);
//  // next( int i)  =>setState(() { currentScreenNum += 1;print(appstate.buffer);
// // });
 

//   List orgsList;
//   @override
//   void initState() {
//     appstate = locator<AppState>();
//     appstate.initRequest();
//    // _selectedOrgType=0;
//     if (appstate.currentUser != null) {
//       appstate.buffer["userID"] = appstate.currentUser["id"];
//       appstate.buffer["contactName"] = appstate.currentUser["name"];
//       appstate.buffer["contactEmail"] = appstate.currentUser["email"];
//      // screens[0] = true;
//       currentScreenNum = 1;
//     }

//     formScreens=[
//       FormModel(
//         h:450.0,
//         icon: Icons.person,
//         formData: userInfo(onSubmit:()=> next(0), )
//       ),
//      FormModel(
//         h:400.0,
//         icon: Icons.person,
//         formData: orgInfo( onSubmit: ()=> next(1),)
//       ),
//       //FormModel(
//       //   formData: {

//       //   }
//       // ),
//       // FormModel(
//       //   formData: {

//       //   }

//       // ),

//     ];

//     loader = CustomLoader();
//     super.initState();
//   }

//   void _submitForm() {
//     loader.showLoader(context);
//     appstate.submitRequest().then((status) {}).whenComplete(
//       () {

//         loader.hideLoader();
//         setState(() {
//          // screens[3] = true;
//                 currentScreenNum += 1;
//         });
//       },
//     );
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
//           //iconButton(2),
//           //iconButton(3)
//         ],
//       ),
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 400.0,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children:[
//             progressRow(),
//             SizedBox( height: 10.0, ), // padForm(userInfoForm(),  h: 450.0),
//             FormScreen(formModel: formScreens[currentScreenNum],),// screenWidgets[currentScreenNum]
//         ]),
//     );
//   }

 
        
//   }  


// //  int _selectedOrgType;
//   // var _userFormKey = GlobalKey<FormState>();
//   // var _orgFormKey = GlobalKey<FormState>();
//   // var _requestFormKey = GlobalKey<FormState>();
//   // var _deliveryFormKey = GlobalKey<FormState>();
// //   onNameChange:(val)=>updateVal("name", val),
//        //   onEmailChange:(val)=>updateVal("email", val),
//          // onOrgNameChange: (val)=>updateVal("name", val),
//          // onAddressChange: (val)=>updateVal("name", val),
//         //  onOrgChange: (val)=>updateVal("name", val),
//     // screenWidgets = [
//     //   padForm(userInfoForm(),  h: 450.0),
//     //   padForm(organizationForm(),  h: 550.0),
//     //   padForm(requestForm(), h:450.0),
//     //   padForm(deliveryForm()),
//     //   padForm(nextSteps(), h:450.0)
//     // ];
//     // Widget padForm(Widget widget, {double h = 400}) => Center(
//     //   child: Container(
//     //       decoration: BoxDecoration(
//     //         color: Colors.white,
//     //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
//     //       ),
//     //       width: 400.0,
//     //       height: h,
//     //       child: Padding(
//     //           padding:
//     //               const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//     //           child: widget)));

//   // Widget userInfoForm() {
//   //   return Container(  
//   //       child: Form(
//   //         key: _userFormKey,
//   //       child: Column(
//   //         children: <Widget>[
//   //           formTitle("Contact Info"),
//   //           SizedBox(
//   //             height: 10.0,
//   //           ),
//   //           formDescription("Name"),
//   //           formEntryField(
//   //             initVal:  safeGet(key:"contactName", map:appstate.buffer, alt:""),
//   //               labelText: 'Name',
//   //               hint: 'Enter Name',
//   //               onChange: (val) =>setState(() => appstate.buffer["contactName"] = val), ),
//   //           SizedBox( height: 40.0, ),
//   //           formDescription("Email"),
//   //           formEntryField(
//   //             initVal:  safeGet(key:"contactEmail", map:appstate.buffer, alt:""),
//   //               labelText: 'Email',
//   //               validator: (val)=>!validateEmail(val)?'Please enter email correctly':null,
//   //               hint: 'Enter Email',
//   //               onChange: (val) =>setState(() => appstate.buffer["contactEmail"] = val)),
//   //           Expanded(child: Container(),),
//   //             MainUIButton(
//   //           onPressed: () {
//   //               // verify
//   //               if (_userFormKey.currentState.validate()) {
//   //                 _userFormKey.currentState.save();
//   //                 setState(() {screens[0] = true;currentScreenNum += 1;}); 
//   //               }
//   //             },
//   //           text:"Next"),
//   //           SizedBox( height:10.0, ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Widget organizationForm() {//print(_selectedOrgType);
//   //   return Form(
//   //         key: _orgFormKey,
//   //         child:Column(children: [
//   //       formTitle("Organization Info"),
//   //       SizedBox(height: 20.0,),
//   //       formDescription("Organization Name:"),
//   //       formEntryField(
//   //            initVal:  safeGet(key:"orgName", map:appstate.buffer, alt:""),
//   //           labelText: 'Organization Name',
//   //           onChange: (val) => setState(() => appstate.buffer["orgName"] = val)),
//   //       SizedBox( height: 20.0,),
//   //       formDescription("Organization Address:"),
//   //       formEntryField(
//   //          initVal:  safeGet(key:"address", map:appstate.buffer, alt:""),
//   //           labelText: 'Organization Address',
//   //           onChange: (val) => setState(() => appstate.buffer["address"] = val)),
//   //       SizedBox(height: 20.0,),
//   //       formDescription("Organization Type:"),
//   //       FormDropDown(
//   //         title: "Select From List",
//   //         options: org,
//   //         selectedIndex: _selectedOrgType,
//   //         onChange: (value) {
//   //           setState(() {
//   //           //  print(value);
//   //             _selectedOrgType = value;
//   //             appstate.buffer["type"] = org[_selectedOrgType];
//   //           });
//   //         },
//   //       ),
//   //       Expanded(child: Container(),),
//   //       MainUIButton(
//   //           onPressed: () {
//   //               if (_orgFormKey.currentState.validate()) {
//   //                 _orgFormKey.currentState.save();
//   //             setState(() {
//   //               screens[1] = true;
//   //               currentScreenNum += 1;
//   //             });}
//   //           },
//   //           text:"Next"),
//   //           SizedBox(
//   //         height:10.0,
//   //       ),
//   //     ]),
//   //   );
//   // }

//   // Widget requestForm() {
  
//   // return  Form(
//   //   key:_requestFormKey,
//   //   child: Column(children: [
//   //         formTitle("Request Info"),
//   //          SizedBox(
//   //               width: 50.0,
//   //             ),
//   //         ...appstate.dataRepo.getItemsWhere("designs",
//   //             fieldFilters: {"isOffered": true}).map((designData) {
//   //           return Row(
//   //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //             children: <Widget>[
//   //                  Center(
//   //                 child: Container(height: 150.0,width: 150.0,
//   //                   child: StylizedImageBox(url: safeGet(key:"url", map:designData, alt:placeHolderUrl))),
//   //               ),
//   //               Column(
//   //                 mainAxisAlignment: MainAxisAlignment.center,
//   //                 crossAxisAlignment: CrossAxisAlignment.center,
//   //                 children: [
//   //                 Text(safeGet(key: "Name", map: designData, alt: "")),
      
//   //                 Container(
//   //                     width: 100,
//   //                     child: formEntryField(
//   //                        initVal:  safeGet(key:designData["id"], map:appstate.buffer["requests"], alt:0).toString(),
//   //                       labelText:'quantity',
//   //                     onChange: (val) {
//   //                       print(val);
//   //                       int v = int.tryParse(val);
//   //                       print(val);
//   //                       if (v != null) {
//   //                         setState(() {
//   //                           if (appstate.buffer["requests"].containsKey(designData["id"])) {
//   //                             appstate.buffer["requests"][designData["id"]] = v;
//   //                           } else {appstate.buffer["requests"][designData["id"]] = v;}
//   //                         });
//   //                       }
//   //                     })),
                         
//   //               ]),
           
//   //             ],
//   //           );
//   //         }).toList(),
//   //          Expanded(child: Container(),),
//   //           MainUIButton(
//   //             onPressed: (){
//   //                if (_requestFormKey.currentState.validate()) {
//   //                _requestFormKey.currentState.save();
//   //               setState(() {
//   //                 screens[2] = true;
//   //                 currentScreenNum += 1;
//   //               });
//   //                }
//   //             },
//   //             text:"Next"),
//   //             SizedBox(
//   //           height:10.0,
//   //         ),
            
//   //       ]),
//   // );
//   // }
//   // Widget deliveryForm() => Form(
//   //   key:_deliveryFormKey,
//   //   child: Column(children: [
//   //         formTitle("Delivery Info"),
//   //         SizedBox(
//   //         height: 20.0,
//   //       ),
//   //        formDescription("Delivery Instructions:", tooltip: "Please enter any information the groups would need to deliver items to you"),
//   //       formEntryField(
//   //         maxLines: 6,
//   //         initVal: safeGet(map:appstate.buffer, key:"deliveryInstructions", alt:""),
//   //           labelText: 'Delivery Instructions',
//   //           onChange: (val) => setState(() => appstate.buffer["deliveryInstructions"] = val)),
//   //             Expanded(child: Container(),),
//   //                  MainUIButton(
//   //             onPressed: () {
//   //                if (_deliveryFormKey.currentState.validate()) {
//   //                _deliveryFormKey.currentState.save();
//   //                 _submitForm();
//   //                }
//   //             },
//   //             text:"Submit"),
//   //              SizedBox( height:10.0,),
//   //       ]),
//   // );

  


// //}



// // class RequestPage extends StatefulWidget {
// //   RequestPage({
// //     Key key,
// //   }) : super(key: key);

// //   @override
// //   _RequestPageState createState() => _RequestPageState();
// // }

// // class _RequestPageState extends State<RequestPage> {
// //   AppState appstate;
// //   CustomLoader loader; // List<String> req = [];
// //   bool loggedIn = false;
// //   bool orgFound;
// //   List screens = [false, false, false, false];
// //   List icons = [  Icons.person_outline,  Icons.pin_drop,Icons.local_mall, Icons.verified_user];
// //   List tips = [  "User Info",  "Organization Info","Requests", "Delivery Instructions"];
// //   List screenWidgets;
// //   int currentScreenNum = 0;
// //   int _selectedOrgType;
// //   var _userFormKey = GlobalKey<FormState>();
// //   var _orgFormKey = GlobalKey<FormState>();
// //   var _requestFormKey = GlobalKey<FormState>();
// //   var _deliveryFormKey = GlobalKey<FormState>();
// //    // List<int> orders = [0, 0];

// //   List orgsList;
// //   @override
// //   void initState() {
// //     appstate = locator<AppState>();
// //     appstate.initRequest();
// //     _selectedOrgType=0;
// //     if (appstate.currentUser != null) {
// //       appstate.buffer["userID"] = appstate.currentUser["id"];
// //       appstate.buffer["contactName"] = appstate.currentUser["name"];
// //       appstate.buffer["contactEmail"] = appstate.currentUser["email"];
// //       screens[0] = true;
// //       currentScreenNum = 1;
// //     }
// //     loader = CustomLoader();
// //     super.initState();
// //   }

// //   void _submitForm() {
// //     loader.showLoader(context);
// //     appstate.submitRequest().then((status) {}).whenComplete(
// //       () {

// //         loader.hideLoader();
// //         setState(() {
// //           screens[3] = true;
// //                 currentScreenNum += 1;
// //         });
// //       },
// //     );
// //   }

// //   Widget padForm(Widget widget, {double h = 400}) => Center(
// //       child: Container(
// //           decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius: BorderRadius.all(Radius.circular(5.0)),
// //           ),
// //           width: 400.0,
// //           height: h,
// //           child: Padding(
// //               padding:
// //                   const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
// //               child: widget)));

// //   Widget userInfoForm() {
// //     return Container(  
// //         child: Form(
// //           key: _userFormKey,
// //         child: Column(
// //           children: <Widget>[
// //             formTitle("Contact Info"),
// //             SizedBox(
// //               height: 10.0,
// //             ),
// //             formDescription("Name"),
// //             formEntryField(
// //               initVal:  safeGet(key:"contactName", map:appstate.buffer, alt:""),
// //                 labelText: 'Name',
// //                 hint: 'Enter Name',
// //                 onChange: (val) =>
// //                     setState(() => appstate.buffer["contactName"] = val),
// //                   ),
// //             SizedBox( height: 40.0, ),
// //             formDescription("Email"),
// //             formEntryField(
// //               initVal:  safeGet(key:"contactEmail", map:appstate.buffer, alt:""),
// //                 labelText: 'Email',
// //                 validator: (val)=>!validateEmail(val)?'Please enter email correctly':null,
// //                 hint: 'Enter Email',
// //                 onChange: (val) =>
// //                     setState(() => appstate.buffer["contactEmail"] = val)),
// //             Expanded(child: Container(),),
// //               MainUIButton(
// //             onPressed: () {
// //                 // verify
// //                 if (_userFormKey.currentState.validate()) {
// //                   _userFormKey.currentState.save();
// //                   setState(() {
// //                   screens[0] = true;
// //                   currentScreenNum += 1;
// //                 }); 
// //                 }
// //               },
// //             text:"Next"),
// //             SizedBox( height:10.0, ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget organizationForm() {
// //     //print(_selectedOrgType);
// //     return Form(
// //           key: _orgFormKey,
// //           child:Column(children: [
// //         formTitle("Organization Info"),
// //         SizedBox(height: 20.0,),
// //         formDescription("Organization Name:"),
// //         formEntryField(
// //              initVal:  safeGet(key:"orgName", map:appstate.buffer, alt:""),
// //             labelText: 'Organization Name',
// //             onChange: (val) => setState(() => appstate.buffer["orgName"] = val)),
// //         SizedBox( height: 20.0,),
// //         formDescription("Organization Address:"),
// //         formEntryField(
// //            initVal:  safeGet(key:"address", map:appstate.buffer, alt:""),
// //             labelText: 'Organization Address',
// //             onChange: (val) => setState(() => appstate.buffer["address"] = val)),
// //         SizedBox(height: 20.0,),
// //         formDescription("Organization Type:"),
// //         FormDropDown(
// //           title: "Select From List",
// //           options: org,
// //           selectedIndex: _selectedOrgType,
// //           onChange: (value) {
// //             setState(() {
// //             //  print(value);
// //               _selectedOrgType = value;
// //               appstate.buffer["type"] = org[_selectedOrgType];
// //             });
// //           },
// //         ),
// //         Expanded(child: Container(),),
// //         MainUIButton(
// //             onPressed: () {
// //                 if (_orgFormKey.currentState.validate()) {
// //                   _orgFormKey.currentState.save();
// //               setState(() {
// //                 screens[1] = true;
// //                 currentScreenNum += 1;
// //               });}
// //             },
// //             text:"Next"),
// //             SizedBox(
// //           height:10.0,
// //         ),
// //       ]),
// //     );
// //   }

// //   Widget requestForm() {
  
// //   return  Form(
// //     key:_requestFormKey,
// //     child: Column(children: [
// //           formTitle("Request Info"),
// //            SizedBox(
// //                 width: 50.0,
// //               ),
// //           ...appstate.dataRepo.getItemsWhere("designs",
// //               fieldFilters: {"isOffered": true}).map((designData) {
// //             return Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: <Widget>[
// //                    Center(
// //                   child: Container(height: 150.0,width: 150.0,
// //                     child: StylizedImageBox(url: safeGet(key:"url", map:designData, alt:placeHolderUrl))),
// //                 ),
// //                 Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: [
// //                   Text(safeGet(key: "Name", map: designData, alt: "")),
      
// //                   Container(
// //                       width: 100,
// //                       child: formEntryField(
// //                          initVal:  safeGet(key:designData["id"], map:appstate.buffer["requests"], alt:0).toString(),
// //                         labelText:'quantity',
// //                       onChange: (val) {
// //                         print(val);
// //                         int v = int.tryParse(val);
// //                         print(val);
// //                         if (v != null) {
// //                           setState(() {
// //                             if (appstate.buffer["requests"].containsKey(designData["id"])) {
// //                               appstate.buffer["requests"][designData["id"]] = v;
// //                             } else {appstate.buffer["requests"][designData["id"]] = v;}
// //                           });
// //                         }
// //                       })),
                         
// //                 ]),
           
// //               ],
// //             );
// //           }).toList(),
// //            Expanded(child: Container(),),
// //             MainUIButton(
// //               onPressed: (){
// //                  if (_requestFormKey.currentState.validate()) {
// //                  _requestFormKey.currentState.save();
// //                 setState(() {
// //                   screens[2] = true;
// //                   currentScreenNum += 1;
// //                 });
// //                  }
// //               },
// //               text:"Next"),
// //               SizedBox(
// //             height:10.0,
// //           ),
            
// //         ]),
// //   );
// //   }
// //   Widget deliveryForm() => Form(
// //     key:_deliveryFormKey,
// //     child: Column(children: [
// //           formTitle("Delivery Info"),
// //           SizedBox(
// //           height: 20.0,
// //         ),
// //          formDescription("Delivery Instructions:", tooltip: "Please enter any information the groups would need to deliver items to you"),
// //         formEntryField(
// //           maxLines: 6,
// //           initVal: safeGet(map:appstate.buffer, key:"deliveryInstructions", alt:""),
// //             labelText: 'Delivery Instructions',
// //             onChange: (val) => setState(() => appstate.buffer["deliveryInstructions"] = val)),
// //               Expanded(child: Container(),),
// //                    MainUIButton(
// //               onPressed: () {
// //                  if (_deliveryFormKey.currentState.validate()) {
// //                  _deliveryFormKey.currentState.save();
// //                   _submitForm();
// //                  }
// //               },
// //               text:"Submit"),
// //                SizedBox( height:10.0,),
// //         ]),
// //   );

// //         Widget nextSteps() => Column(children: [
// //         formTitle("Next Steps"),
// //         SizedBox(
// //         height: 10.0,
// //       ),
// //        formDescription("1. Verification - We will verify your information and approve the requests.",),
// //         SizedBox( height:10.0,),
// //        formDescription("2. Claim - Users will 'claim' these items. We will share the delivery instructions with them and notify you of their expected delivery time. ",),
// //       SizedBox( height:10.0,),
// //        formDescription("3. Delivery - The users will drop off the finished items.",),
// //             Expanded(child: Container(),),
// //                  MainUIButton(
// //             onPressed: () {
// //                 var platformInfo=locator<PlatformInfo>();
// //         setState(() {
// //            platformInfo.setOverlay("");
          
// //         });
// //             },
// //             text:"Finish"),
// //              SizedBox( height:10.0,),
// //       ]);







// //   Widget iconButton(int itemNum){
// //         bool current = itemNum==currentScreenNum;
// //         bool done = screens[itemNum];
// //       return  Container(
// //           decoration: BoxDecoration(
// //           border: Border.all(color:current?Colors.blue:done?Colors.green:Colors.grey, width: 2.0),
// //             shape:BoxShape.circle
// //             ),
// //           child:Tooltip(
// //             message: tips[itemNum],
// //             child: Padding(
// //               padding: EdgeInsets.all(3.0),
// //               child: IconButton(
// //                 onPressed: (){
// //                   bool isAvailable=true;
// //                   for (int i = 0;i<itemNum; i++){
// //                     if(!screens[i])isAvailable=false;
// //                   }
// //                   if(isAvailable)
// //                   setState(() {
// //                     currentScreenNum=itemNum;
// //                   });
// //                 },
// //                 icon: Icon(icons[itemNum], color: done?Colors.green:Colors.grey,)),
// //             ),
// //           )).showCursorOnHover.moveUpOnHover;
// //   }    

// //   Widget progressRow()=>Container(
// //        decoration: BoxDecoration(
// //             color: Colors.white,//.withOpacity(0.9),
// //             borderRadius: BorderRadius.all(Radius.circular(50.0)),
// //           ),
// //     width: 400.0,
// //     child: Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //         children: <Widget>[
// //           iconButton(0),
// //           iconButton(1),
// //           iconButton(2),
// //           iconButton(3)
// //         ],
// //       ),
// //     ),
// //   );
// //   @override
// //   Widget build(BuildContext context) {
// //     screenWidgets = [
// //       padForm(userInfoForm(),  h: 450.0),
// //       padForm(organizationForm(),  h: 550.0),
// //       padForm(requestForm(), h:450.0),
// //       padForm(deliveryForm()),
// //       padForm(nextSteps(), h:450.0)
  
// //     ];
// //     return Container(
// //       width: 400.0,
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children:[
// //            progressRow(),
// //             SizedBox( height: 10.0, ),
// //             screenWidgets[currentScreenNum]
// //         ]),
// //     );
// //   }
// // }




















// //userInfoForm(),

// //  ListView(
// //     children: [
// //      userInfoForm(w),
// //  SizedBox(height: 20.0,),
// //   organizationForm(w),
// //   SizedBox(height: 20.0,),
// //   formTitle("Requests", underline: true),
// //  requestForm(w),
// //  SizedBox(height: 20.0,),
// //  altJButton(w: w, onPressed: _submitForm, text: "Submit")
// //  ]),

// //   Widget organizationForm(double w) {
// //     List<Widget> formOptions =[
// //       formTitle("Organization Info"),
// //        Row(
// //         children: <Widget>[
// //           Text("Is Your Organization Listed Below?"),
// //           Expanded(child: Container(),),
// //            FlatButton(onPressed: (){setState((){orgFound = false;});},
// //             child: Text("No")),
// //           Switch(
// //           value: orgFound??false,
// //           onChanged: (value) {
// //             setState(() {orgFound = value;});
// //           },
// //           activeTrackColor: Colors.lightGreenAccent,
// //           activeColor: Colors.green,
// //     ),
// //           FlatButton(onPressed: (){setState((){orgFound = true;});},
// //             child: Text("Yes")),
// //            Expanded(child: Container(),),
// //     ])
// //     ];
// //     if(orgFound==null || orgFound){

// //     }
// //    else{  formOptions.addAll(newOrganizationForm());  }
// //   return  Column(
// //       children: formOptions
// //     );
// //   }

// //  List<Widget> newOrganizationForm() {
// //     return [
// //       formInputSimple('Organization Name',(val) => setState(() => appstate.buffer["orgName"] = val)),
// //       SizedBox(height: 20.0,),
// //       formInputSimple('Organization Address',(val) => setState(() => appstate.buffer["address"] = val)),
// //  SizedBox(height: 20.0,),
// // formDescription("Organization Type:"),
// //  SizedBox(height: 20.0,),
// //       FormDropDown(
// //         title: "Select From List",
// //         options: org,
// //         selectedIndex: _selectedOrgType,
// //         onChange: (value) {
// //           setState(() {
// //             _selectedOrgType = value;
// //             appstate.buffer["type"] = org[_selectedOrgType];
// //           });
// //         },
// //       ),
// //     ];
// //   }

// // formOptions.add(
// //    SearchableDropdown.single(
// //     items: items,
// //     value: currentOrg,
// //     hint: "Select Existing Organization",
// //     searchHint: null,
// //     onChanged: (value) {
// //       setState(() {
// //         currentOrg = value;
// //         print(value);
// //         appstate.buffer["orgName"] = value;
// //         if(value=="")appstate.buffer["orgID"] = value;
// //         else{
// //           appstate.buffer["orgID"] = orgNamePairs[value];
// //         }
// //       });
// //     },
// //     dialogBox: false,
// //     isExpanded: true,
// //     menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
// //   ),
// // );

// // PlacesSearchResponse s = await places.searchByText("1912 Marsh Rd, Wilmington, DE 19810", location: Location(39.18, -75.277));
// // print("Done");
// // print(s.toJson());

// // int _selectedOrgType = 0; // List<int> orders = [0, 0];
// //Map<String, String> orgNamePairs;
// // List orgsList ;
// //orgNamePairs={};
// //final List<DropdownMenuItem> items = [];
// // String currentOrg;
// //   List l = appstate.getItemsWhere("orgs");
// //   l.forEach((des) {
// //     orgNamePairs[des["name"]]=des["id"];
// //   });
// //   items.add(
// //   DropdownMenuItem(
// //           child: Text(""),
// //           value: "",
// //         ));
// //     orgNamePairs.keys.forEach((orgName) {
// //       items.add(
// //   DropdownMenuItem(
// //           child: Text(orgName),
// //           value: orgName,
// //         ));
// //     });
// //  // orgsList.addAll( orgNamePairs.keys.toList());

// // FlatButton(
// //       shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.circular(30)),
// //       color: Colors.grey[300],
// //       onPressed: (){},
// //     //  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
// //       child: TitleText("", color: Colors.black),
// //     ),

// // bool newOrgOpen = true;
// // String orgID;
// // String displayName = "";
// // String email = "";

// // If user is signed in
// // if individual
// // If first vs additional
// // Work there, connected to there(), reached out from list
// // (_selectedOrgType == org.length - 1) // If other enter org type
// //     ? formEntryField( labelText: 'Organization Type', hint: 'Enter Organization Type',
// //         onChange: (val) => setState(() => appstate.buffer["type"] = val))
// //     : Container(),

// // formEntryField(labelText: 'Organization Address',hint: 'Enter Organization Address',
// //     onChange: (val) => setState(() => appstate.buffer["address"] = val)),
// //

// //   )
// // //https://medium.com/flutter-community/realistic-forms-in-flutter-part-1-327929dfd6fd
// // formTitle("Contact Info"),
// //                   formEntryField(
// //                       labelText: 'Name',
// //                       hint: 'Enter Name',
// //                       onChange: (val) => setState(
// //                           () => appstate.buffer["contactName"] = val)),
// //                   formEntryField(
// //                       w: w,
// //                       labelText: 'Email',
// //                       hint: 'Enter Email',
// //                       onChange: (val) => setState(
// //                           () => appstate.buffer["contactEmail"] = val)),
// // Widget formTextField() => Container(
// //       width: double.infinity,
// //       child: Row(
// //         children: <Widget>[
// //           TextFormField(
// //               decoration: InputDecoration(labelText: 'quantity'),
// //               keyboardType: TextInputType.number,
// //               onChanged: (val) {}),
// //         ],
// //       ),
// //     );


// List<Widget> openReqWidgets(Design design){
//     int index;
//     if (requests.any((request) => request.designID == design.id)) {
//       index = requests.indexWhere((request) => request.designID == design.id);
//     } else {
//     //  requests.add( widget.dataController.newRequest(orgID: orgID, designID: design.id,));
//       index = requests.length - 1;
//     }
//     return  [
//       formTitle(design.name),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 100.0,
//             child: Center(child: imageFromPath(design.imagePath)),
//           ),
//         ),
//         TextFormField(
//           decoration: InputDecoration(labelText: '# items requested'),
//           validator: (value) {
//             if (value.isEmpty) {
//               return 'Please enter quantity';
//             }
//             if (int.tryParse(value) == null) return 'Please enter number';
//           },
//           onChanged: (val) => setState(() {
//               requests[index].quantityRequested = int.tryParse(val) ?? 0;
//               if(design.id=="faceshield")_org.sheilds=int.tryParse(val) ??0;
//               else _org.earsavers=int.tryParse(val)??0 ;
//              // _org.
//           }
//         )),
//       ];
//   }


// // // );
// // // class RequestPPEWidget extends StatefulWidget {
// // //   final DataController dataController;
// // //   final Function() onDone;

// // //   RequestPPEWidget({Key key, this.dataController, this.onDone})
// // //       : super(key: key);

// // //   @override
// // //   _RequestPPEWidgetState createState() => _RequestPPEWidgetState();
// // // }

// // // class _RequestPPEWidgetState extends State<RequestPPEWidget> {

// // // }

  
  
  
  
  
  
//   // List screens = [false, false, false, false];
//   // List icons = [  Icons.person_outline,  Icons.pin_drop,Icons.local_mall, Icons.verified_user];
//   // List tips = [  "User Info",  "Organization Info","Requests", "Delivery Instructions"];
//   // List screenWidgets;


// // Widget newOrganizationForm()=>   Container(
// //               height: double.infinity,
// //               width: double.infinity,
// //               child: Padding(
// //                   padding: EdgeInsets.all(8.0),
// //                   child: ListView(
// //                       children: <Widget>[
// //                     formTitle("New Request Form", underline: true),
// //                     formTitle("Contact Info"),
// //                     formEntryField(
// //                         labelText: 'Name',
// //                         hint: 'Enter Name',
// //                         onChange: (val) => setState(
// //                             () => appstate.buffer["contactName"] = val)),
// //                     formEntryField(
// //                         w: w,
// //                         labelText: 'Email',
// //                         hint: 'Enter Email',
// //                         onChange: (val) => setState(
// //                             () => appstate.buffer["contactEmail"] = val)),
// //                     formTitle("Organization Info"),
// //                     formDescription("Organization Type:"),
// //                     FormDropDown(
// //                       title: "Select From List",
// //                       options: org,
// //                       selectedIndex: _selectedOrgType,
// //                       onChange: (value) {
// //                         setState(() {
// //                           _selectedOrgType = value;
// //                           appstate.buffer["type"] = org[_selectedOrgType];
// //                         });
// //                       },
// //                     ),
// //                     (_selectedOrgType ==
// //                             org.length - 1) // If other enter org type
// //                         ? formEntryField(
// //                             labelText: 'Organization Type',
// //                             hint: 'Enter Organization Type',
// //                             onChange: (val) =>
// //                                 setState(() => appstate.buffer["type"] = val))
// //                         : Container(),
// //                     formEntryField(
// //                         labelText: 'Organization Name',
// //                         hint: 'Enter Organization Name',
// //                         onChange: (val) =>
// //                             setState(() => appstate.buffer["orgName"] = val)),
// //                     formEntryField(
// //                         labelText: 'Organization Address',
// //                         hint: 'Enter Organization Address',
// //                         onChange: (val) =>
// //                             setState(() => appstate.buffer["address"] = val)),]))

