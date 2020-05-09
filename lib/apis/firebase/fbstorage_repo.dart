// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:firebase/firebase.dart' as fb;
// import 'package:universal_html/prefer_universal/html.dart' as html;

// Future<Uri> uploadImageFile(html.File image,
//         {String imageName}) async {
//           print(image.name);
//       fb.StorageReference storageRef = fb.storage().ref('images/$imageName');
//       fb.UploadTaskSnapshot uploadTaskSnapshot = await storageRef.put(image).future;

//       Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
//       print(imageUri.toString());
//       print(imageUri.path);
//       return imageUri;
//   }

// Future<Uri> uploadImage(String imageName) {
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
//            // print("hi");
//              await uploadImageFile(file, imageName:imageName);
//             //uploadToFirebase(file);
//           },
//         );
//       },
//     );
//   }
 
 
//  Future<Uri> getImageURI({@required String imagePath}) async{
//         fb.StorageReference storageReference = fb.storage().ref(imagePath); 
//         return storageReference.getDownloadURL();
    
// }
// Future<Widget> getStorageImage({String image, String downloadUrl}) async{
//   if(downloadUrl!=null){  //await Future.delayed(Duration(seconds: 1));
//     return Image.network(
//         downloadUrl,
//         fit: BoxFit.scaleDown,);
//   }
//   if(image!=null){ 
//     Uri u = await getImageURI(imagePath: image);
//       return Image.network(
//         u.path,
//         fit: BoxFit.scaleDown,);
//   }
//   return Container();


// }


// Widget wwww({BuildContext context, String image, String downloadUrl})=>
//  Container(
//                         height:400.0,
//                         margin: const EdgeInsets.only(
//                             left: 30.0, right: 30.0, top: 10.0),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(30.0),
//                           child: FutureBuilder(
//                             future: getStorageImage(image:image, downloadUrl:downloadUrl),
//                             builder: (context, snapshot) {
//                               if (snapshot.connectionState ==
//                                   ConnectionState.done)
//                                 return Container(
//                                   height:300.0,//  MediaQuery.of(context).size.height / 1.25,
//                                   width:300.0,// MediaQuery.of(context).size.width / 1.25,
//                                   child: snapshot.data,
//                                 );

//                               if (snapshot.connectionState ==
//                                   ConnectionState.waiting)
//                                 return Container(
//                                     height: 300.0,
//                                    // MediaQuery.of(context).size.height /   1.25,
//                                     width: 300.0,
//                                     //MediaQuery.of(context).size.width / 1.25,
//                                     child: CircularProgressIndicator());
//                               return Container();
//                             },
//                           ),
//                         ));



 // return imageUri;
  //  .ref()
           /// .child('user/profile/${Path.basename(image.path)}');
      //  fb.UploadTaskSnapshot uploadTaskSnapshot = await storageReference.put(image).future;
        //await uploadTask.onComplete.then((value) {
  // Future<Widget> _getImage(BuildContext context, String image) async {
  //   Image m;
  //   await FireStorageService.loadFromStorage(context, image)
  //       .then((downloadUrl) {
  //     m = Image.network(
  //       downloadUrl.toString(),
  //       fit: BoxFit.scaleDown,
  //     );
  //   });
  //   return m;
  // }
//   class LoadFirbaseStorageImage extends StatefulWidget{
 
//   @override
//   _LoadFirbaseStorageImageState createState() =>
//       _LoadFirbaseStorageImageState();
// }

// class _LoadFirbaseStorageImageState extends State<LoadFirbaseStorageImage> {
 

//   Expanded(
//     //Image Loading code goes here
//     child: FutureBuilder(
//             future: _getImage(context, image),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState ==
//                   ConnectionState.done)
//                 return Container(
//                   height:
//                       MediaQuery.of(context).size.height / 1.25,
//                   width:
//                       MediaQuery.of(context).size.width / 1.25,
//                   child: snapshot.data,
//                 );

//               if (snapshot.connectionState ==
//                   ConnectionState.waiting)
//                 return Container(
//                     height: MediaQuery.of(context).size.height /
//                         1.25,
//                     width: MediaQuery.of(context).size.width /
//                         1.25,
//                     child: CircularProgressIndicator());

//               return Container();
//             },
//           ),
//         ),
//         //This is button to toggle image.
//         loadButton(context),
// }
