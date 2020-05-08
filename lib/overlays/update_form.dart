import 'package:de_makes_final/repos/fbstorage_repo.dart';
import 'package:de_makes_final/service_locator.dart';
import 'package:de_makes_final/shared_widgets/shared_widgets.dart';
import 'package:de_makes_final/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
class UpdateForm extends StatefulWidget {
  const UpdateForm({Key key, }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UpdateFormState();
}
class _UpdateFormState extends State<UpdateForm> {
  CustomLoader loader;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String downloadurl;
  String imgName;
  //String _designID;
  int _quantity;
  @override
  void initState() {
    loader = CustomLoader();
    super.initState();
  }
  void _submitForm() {
    if (_quantity ==null) {
      customSnackBar(_scaffoldKey, 'Please enter quantity');
      return;
    }
    loader.showLoader(context);
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    var appstate =  locator<AppState>();
   // User currentUser = appstate.currentUser;
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
                             wwww(context: context, downloadUrl: "https://firebasestorage.googleapis.com/v0/b/twitter-clone3.appspot.com/o/images%2FimageName?alt=media&token=0d76b938-e655-491c-9b12-aae26e6cdd79"),
          RaisedButton(
          child: Text("Upload"),
          onPressed: (){
           // fbStorage
           uploadImage("imageName");
          //  widget.dataController.storageRepo.uploadImage(update.id);
          //  update.imagePath="images/${update.id}";
           // update.imgSource="firebase";
          }
          ),
                    formEntryField(
                      w: w,
                      isNumber: true,
                        labelText: 'quantity',hint: 'Enter quantity',
                        onChange: (val) {
                          int v = int.tryParse(val);
                          if(v!=null)
                          setState(() => _quantity = v);}),
                          // Only show if use has claims open
                  // (currentUser.openClaims>0)?
                    formDescription("Chose associated open claim(if applicable):"),//:Container(),
                    altButton(w: w, onPressed:_submitForm, text: "Submit")
                   // formSave("Save", onSave:_submitForm)
                  ]))),
          closeIcon(onPressed: null)
        ]));
  }
}






  // String _password;
  // String _passwordConfirm;
  // String _claimID;
  // User Get Claims
  // Get All Designs








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