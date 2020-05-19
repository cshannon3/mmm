
// import 'package:delaware_makes/service_locator.dart';
// import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
// import 'package:delaware_makes/state/app_state.dart';
// import 'package:delaware_makes/state/platform_state.dart';
// import 'package:delaware_makes/utils/utils.dart';
// import 'package:flutter/material.dart';

// import 'package:firebase/firebase.dart' as fb;
// import 'package:universal_html/prefer_universal/html.dart' as html;


// class UpdateForm extends StatefulWidget {
//   const UpdateForm({Key key, }) : super(key: key);
//   @override
//   State<StatefulWidget> createState() => _UpdateFormState();
// }

// class _UpdateFormState extends State<UpdateForm> {
// CustomLoader loader;
//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   String downloadurl;
//   String imgPath = "https://www.ajactraining.org/wp-content/uploads/2019/09/image-placeholder.jpg";
//   AppState appstate;
//   Map<String, String> designNamePairs;
//   List d;
//   PlatformInfo platformInfo;

//   int currentIndex=0;
  
//   @override
//   void initState() {
//    appstate =  locator<AppState>();
//    platformInfo= locator<PlatformInfo>();
//     //appstate.initUpdate();
//     designNamePairs={};
//     List l = appstate.dataRepo.getItemsWhere("designs");
//     l.forEach((des) {
//       designNamePairs[des["name"]]=des["id"];
//     });//dataRepo.getNameIDMap("designs");
//     d=designNamePairs.keys.toList();
//     appstate.buffer["designID"] = designNamePairs[d[currentIndex]];
//     appstate.buffer["designName"]=d[currentIndex];
   
//     print(designNamePairs);
//     loader = CustomLoader();
//     super.initState();
//   }
//   void _submitForm() {
//     if (appstate.buffer["quantity"] ==0) {
//       customSnackBar(_scaffoldKey, 'Please enter quantity');
//       return;
//     }
    
//     appstate.submitUpdate(appstate.buffer).then((status) { 
//     }).whenComplete( () {
//         loader.hideLoader();
//         platformInfo.setOverlay("");
//        // tappedMenuButton(context, "/profile");
//       },
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     return Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5.0),
//           color: Colors.white,
//         ),
//         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
//         child:
//           Container(
//               height: double.infinity,
//               width: double.infinity,
//               child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ListView(children: <Widget>[
//                     (appstate.buffer.containsKey("claimID"))?claimInfo(w):inputtedInfo(w),
//                 Center(child: Container(width:300.0, height:300.0, 
//                 child:Image.network(imgPath)
//                 ,),),
//                  MainUIButton(
//                  text: "Upload",
//                  onPressed:(){uploadImage();}, ),
//                  SizedBox(height: 20.0,),
//                   MainUIButton(
//                  text: "Submit",
//                  onPressed:_submitForm, ),
                  
//                   ])
//                   )
//                   ),
//           //closeIcon(onPressed: null)
//         );
//   }
//   Widget claimInfo(double w)=>
//      Column(children: <Widget>[
//                  formTitle("Claim Update", underline: true),
//                       // formEntryField(w: w,
//                       //   labelText: 'Notes',hint: 'Enter any',
//                       //   onChange: (val) => setState(() => appstate.buffer['description'] = val)),
//          // formDescription("Design: }", ),
//           formDescription("Quantity: ${appstate.buffer["quantity"]}", ),
//     ],);

  

//   Widget inputtedInfo(double w)=>
//     Column(children: <Widget>[
//                  formTitle("New Update", underline: true),
//                       formEntryField(w: w,
//                         labelText: 'Title',hint: 'Enter title',
//                         onChange: (val) => setState(() => appstate.buffer['name'] = val)),
                
//            FormDropDown(
//                   title: "Select Design Type",
//                   options: d,
//                   selectedIndex: currentIndex,
//                   onChange: (value) {
//                     setState(() {
//                     currentIndex= value;
//                       appstate.buffer["designID"] = designNamePairs[d[currentIndex]];
//                       appstate.buffer["designName"]=d[currentIndex];
//                     });
//                   },
//                 ),
//                   formEntryField(
//                       w: w,
//                       isNumber: true,
//                         labelText: 'quantity',hint: 'Enter quantity',
//                         onChange: (val) {
//                           int v = int.tryParse(val);
//                           if(v!=null)
//                           setState(() => appstate.buffer["quantity"] = v);}),
//     ],);

  

//   uploadImageFile(html.File image,
//         ) async { // print(image.name);
//         String name = safeGet(map:appstate.currentUser??{}, key:"displayName", alt:"");
//         String label = name + generateIDTime().substring(0, 5);
//       fb.StorageReference storageRef = fb.storage().ref('userupdates/$label');
//       fb.UploadTaskSnapshot uploadTaskSnapshot = await storageRef.put(image).future;
//       Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
//       loader.hideLoader();
//       setState(() {
//          imgPath = imageUri.toString();
//          appstate.buffer["url"]=imgPath;
//       });
//       return imageUri;
//   }
  
//  uploadImage() {
//     // HTML input element
//     html.InputElement uploadInput = html.FileUploadInputElement();
//     uploadInput.click();
//     uploadInput.onChange.listen(
//       (changeEvent) {
//         final file = uploadInput.files.first;
//         final reader = html.FileReader();
//         reader.readAsDataUrl(file);
//         reader.onLoadEnd.listen(
//           // After file finiesh reading and loading, it will be uploaded to firebase storage
//           (loadEndEvent) async {
//             loader.showLoader(context);
//              uploadImageFile(file,);
//           },
//         );
//       },
//     );
//   }
// }







//  uploadImage(String imageName) {
//     // HTML input element
//     html.InputElement uploadInput = html.FileUploadInputElement();
//     uploadInput.click();

//     uploadInput.onChange.listen(
//       (changeEvent) {
//         final file = uploadInput.files.first;
//         final reader = html.FileReader();
//         // The FileReader object lets web applications asynchronously read the
//         // contents of files (or raw data buffers) stored on the user's computer,
//         // using File or Blob objects to specify the file or data to read.
//         // Source: https://developer.mozilla.org/en-US/docs/Web/API/FileReader

//         reader.readAsDataUrl(file);
//         // The readAsDataURL method is used to read the contents of the specified Blob or File.
//         //  When the read operation is finished, the readyState becomes DONE, and the loadend is
//         // triggered. At that time, the result attribute contains the data as a data: URL representing
//         // the file's data as a base64 encoded string.
//         // Source: https://developer.mozilla.org/en-US/docs/Web/API/FileReader/readAsDataURL

//         reader.onLoadEnd.listen(
//           // After file finiesh reading and loading, it will be uploaded to firebase storage
//           (loadEndEvent) async {
//             loader.showLoader(context);
//              uploadImageFile(file, imageName:imageName);
//           },
//         );
//       },
//     );
//   }
 
// }




  //print(imageUri.toString());
     // print(imageUri.path);

  // formEntryField(w: w,
                    //     labelText: 'description',hint: 'Enter description',
                    //     onChange: (val) => setState(() => appstate.buffer['description'] = val)),
                    //       Center(child: Container(height: 200.0, width:200.0, child: Image.network(imgPath),)),
                    //        //  wwww(context: context, downloadUrl: imgPath),


 //appstate.buffer["designID"]=designNamePairs.keys.toList()[currentIndex];