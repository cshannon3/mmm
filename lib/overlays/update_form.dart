
import 'package:de_makes_final/service_locator.dart';
import 'package:de_makes_final/shared_widgets/shared_widgets.dart';
import 'package:de_makes_final/state/app_state.dart';
import 'package:flutter/material.dart';

import 'package:firebase/firebase.dart' as fb;
import 'package:universal_html/prefer_universal/html.dart' as html;


class UpdateForm extends StatefulWidget {
  const UpdateForm({Key key, }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UpdateFormState();
}
class _UpdateFormState extends State<UpdateForm> {
  CustomLoader loader;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String downloadurl;
  String imgPath = "https://www.ajactraining.org/wp-content/uploads/2019/09/image-placeholder.jpg";
  var appstate; 
  @override
  void initState() {
    appstate =  locator<AppState>();
    loader = CustomLoader();
    super.initState();
  }
  void _submitForm() {
    if (appstate.buffer["quantity"] ==null) {
      customSnackBar(_scaffoldKey, 'Please enter quantity');
      return;
    }
    loader.showLoader(context);
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Stack(children: <Widget>[
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(children: <Widget>[
                    formTitle("New Update", underline: true),
                      formEntryField(w: w,
                        labelText: 'Title',hint: 'Enter title',
                        onChange: (val) => setState(() => appstate.buffer['title'] = val)),
                    formEntryField(w: w,
                        labelText: 'description',hint: 'Enter description',
                        onChange: (val) => setState(() => appstate.buffer['description'] = val)),
                          Center(child: Container(height: 200.0, width:200.0, child: Image.network(imgPath),)),
                          
                           //  wwww(context: context, downloadUrl: imgPath),
          RaisedButton(
          child: Text("Upload"),
          onPressed: (){uploadImage("imageName");}
          //  widget.dataController.storageRepo.uploadImage(update.id);
          //  update.imagePath="images/${update.id}";
           // update.imgSource="firebase";
          
          ),
                    formEntryField(
                      w: w,
                      isNumber: true,
                        labelText: 'quantity',hint: 'Enter quantity',
                        onChange: (val) {
                          int v = int.tryParse(val);
                          if(v!=null)
                          setState(() => appstate.buffer["quantity"] = v);}),
                    formDescription("Chose associated open claim(if applicable):"),//:Container(),
                    altButton(w: w, onPressed:_submitForm, text: "Submit")
                   // formSave("Save", onSave:_submitForm)
                  ]))),
          closeIcon(onPressed: null)
        ]));
  }
  uploadImageFile(html.File image,
        {String imageName}) async {
          print(image.name);
      fb.StorageReference storageRef = fb.storage().ref('images/$imageName');
      fb.UploadTaskSnapshot uploadTaskSnapshot = await storageRef.put(image).future;

      Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
      print(imageUri.toString());
      print(imageUri.path);
      setState(() {
         imgPath = imageUri.toString();
      });
      return imageUri;
  }
 uploadImage(String imageName) {
    // HTML input element
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen(
      (changeEvent) {
        final file = uploadInput.files.first;
        final reader = html.FileReader();
        // The FileReader object lets web applications asynchronously read the
        // contents of files (or raw data buffers) stored on the user's computer,
        // using File or Blob objects to specify the file or data to read.
        // Source: https://developer.mozilla.org/en-US/docs/Web/API/FileReader

        reader.readAsDataUrl(file);
        // The readAsDataURL method is used to read the contents of the specified Blob or File.
        //  When the read operation is finished, the readyState becomes DONE, and the loadend is
        // triggered. At that time, the result attribute contains the data as a data: URL representing
        // the file's data as a base64 encoded string.
        // Source: https://developer.mozilla.org/en-US/docs/Web/API/FileReader/readAsDataURL

        reader.onLoadEnd.listen(
          // After file finiesh reading and loading, it will be uploaded to firebase storage
          (loadEndEvent) async {
           // print("hi");
             uploadImageFile(file, imageName:imageName);
            //uploadToFirebase(file);
          },
        );
      },
    );
  }
 
}








 
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


//   // String _password;
//   // String _passwordConfirm;
//   // String _claimID;
//   // User Get Claims
//   // Get All Designs








    // if (false) {
    //   customSnackBar(_scaffoldKey, 'Please fill form carefully');
    //   return;
    // } else if (_password != _passwordConfirm) {
    //   customSnackBar(
    //       _scaffoldKey, 'Password and confirm password did not match');
    //   return;
    // }
    // User user = User(
    //   email: _email.toLowerCase(),
    //   bio: 'Edit profile to update bio',
    //   displayName: _name,
    //   location: 'Somewhere in universe',
    //   profilePic: dummyProfilePicList[randomNumber],
    //   isVerified: false,
    // );
    // state.signUp(
    //   user,
    //   password: _password,
    //   scaffoldKey: _scaffoldKey,
    // ).then((status) { print(status);
    // }).whenComplete( () {
    //     loader.hideLoader();
    //     if (state.authStatus == AuthStatus.LOGGED_IN) {
    //        state.sendEmailVerification(_scaffoldKey);
    //        tappedMenuButton(context, "/");
    //     }
    //   },
    // );