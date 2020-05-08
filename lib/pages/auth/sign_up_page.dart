import 'dart:math';
import 'package:de_makes_final/models/user.dart';
import 'package:de_makes_final/routes.dart';
import 'package:de_makes_final/service_locator.dart';
import 'package:de_makes_final/shared_widgets/shared_widgets.dart';
import 'package:de_makes_final/state/app_state.dart';
import 'package:de_makes_final/state/auth_state.dart';
import 'package:de_makes_final/utils/utils.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key key,}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  CustomLoader loader;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var state =  locator<AppState>();
  String _name;String _email;
  String _password;String _passwordConfirm;
  
  
  @override
  void initState() {
    loader = CustomLoader();
    super.initState();
  }

  void _googleLogin() {
    if (state.isbusy) {
      return;
    }
    loader.showLoader(context);
    state.authState.handleGoogleSignIn().then((status) {
      // print(status)
      if (state.authState.user != null) {
        loader.hideLoader();
        state.authState.getCurrentUser();
         tappedMenuButton(context, "/");
      } else {
        loader.hideLoader();
        cprint('Unable to login', errorIn: '_googleLoginButton');
      }
    });
  }


  void _submitForm() {
    if (_email ==null ||_email.isEmpty) {
      customSnackBar(_scaffoldKey, 'Please enter name');
      return;
    }
    if (_email.length > 27) {
      customSnackBar(_scaffoldKey, 'Name length cannot exceed 27 character');
      return;
    }
    if (_email == null || _email.isEmpty ||
        _password == null ||  _password.isEmpty ||
        _passwordConfirm == null) {
      customSnackBar(_scaffoldKey, 'Please fill form carefully');
      return;
    } else if (_password != _passwordConfirm) {
      customSnackBar(
          _scaffoldKey, 'Password and confirm password did not match');
      return;
    }

    loader.showLoader(context);
    Random random = new Random();
    int randomNumber = random.nextInt(8);
    User user = User(
      email: _email.toLowerCase(),
      bio: 'Edit profile to update bio',
      displayName: _name,
      location: 'Somewhere in universe',
      profilePic: dummyProfilePicList[randomNumber],
      isVerified: false,
    );
    state.authState.signUp(
      user,
      password: _password,
      scaffoldKey: _scaffoldKey,
    ).then((status) { print(status);
    }).whenComplete( () {
        loader.hideLoader();
        if (state.authState.authStatus == AuthStatus.LOGGED_IN) {
           state.authState.sendEmailVerification(_scaffoldKey);
           tappedMenuButton(context, "/");
        }
      },
    );
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
                    formTitle("Sign Up"),
                    formDescription("Name:"),
                    formEntryField(w: w,
                        labelText: 'Name',hint: 'Enter name',
                        onChange: (val) => setState(() => _name = val)),
                    formDescription("Email:"),
                    formEntryField(w: w,
                        labelText: 'Email',hint: 'Enter email',
                        onChange: (val) => setState(() => _email = val)),
                    formDescription("Password:"),
                    formEntryField(w: w,
                        labelText: 'Password',hint: 'Enter password',isPassword: true,
                        onChange: (val) => setState(() => _password = val)),
                    formEntryField(w: w,
                        labelText: 'Confirm Password',hint: 'Confirm password',isPassword: true,
                        onChange: (val) => setState(() => _passwordConfirm = val)),
                    altButton(w: w, onPressed: _submitForm, text: "Sign Up")
                    //formSave("Save", onSave:_submitForm)
                  ]))),
          closeIcon(onPressed: null)
        ]));
  }
}





