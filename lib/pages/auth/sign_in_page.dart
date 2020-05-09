import 'package:de_makes_final/routes.dart';
import 'package:de_makes_final/service_locator.dart';
import 'package:de_makes_final/shared_widgets/shared_widgets.dart';
import 'package:de_makes_final/state/app_state.dart';
import 'package:de_makes_final/utils/utils.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  CustomLoader loader;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _email;
  String _password;
  var state =  locator<AppState>();//  AuthState state;
   
  @override
  void initState() {
    loader = CustomLoader();
    super.initState();
  }

  void _emailLogin(BuildContext bc) async{
    loader.showLoader(context);
    var isValid = validateCredentials(_scaffoldKey, _email, _password);
    if (isValid) {
      state.signIn(_email, _password, scaffoldKey: _scaffoldKey).then((status) {
        if (state.authState.user != null) {
          state.authState.getCurrentUser().whenComplete(
            () {
              loader.hideLoader();
             // state.currentUser=state.authState.userModel;
             tappedMenuButton(bc, "/profile");});
        } else {
          cprint('Unable to login', errorIn: '_emailLoginButton');
          loader.hideLoader();
        } });
    } else { loader.hideLoader(); }
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
                    formTitle("Sign In"),
                    formDescription("Email:", w:w),
                    formEntryField(w: w,
                        labelText: 'Email',hint: 'Enter email',
                        onChange: (val) => setState(() => _email = val)),
                    formDescription("Password:", w:w),
                    formEntryField( w: w,
                        labelText: 'Password',hint: 'Enter password',isPassword: true,
                        onChange: (val) => setState(() => _password = val)),
                   altButton(w: w, onPressed:(){ _emailLogin(context);}, text: "Sign In")
                  ]))),
          closeIcon(onPressed: null)
        ]));
  }
}


