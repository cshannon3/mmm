import 'package:de_makes_final/models/user.dart';
import 'package:de_makes_final/routes.dart';
import 'package:de_makes_final/service_locator.dart';
import 'package:de_makes_final/shared_widgets/shared_widgets.dart';
import 'package:de_makes_final/state/app_state.dart';
import 'package:flutter/material.dart';

class ClaimsForm extends StatefulWidget {
  const ClaimsForm({Key key,}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ClaimsFormState();
}

class _ClaimsFormState extends State<ClaimsForm> {
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
  void _submitForm() {
    if (_email ==null ||_email.isEmpty) {
      customSnackBar(_scaffoldKey, 'Please enter name');
      return;}
    if (_email.length > 27) {
      customSnackBar(_scaffoldKey, 'Name length cannot exceed 27 character');
      return;}
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
    // TODO
   
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
          Container( height: double.infinity, width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(children: <Widget>[
                   formTitle("Claim"),
                    formDescription(
                      "**All claims have a 3 day expiration. Either make smaller claims and multiple deliveries or wait until you've printed the items before filling out the claim",
                      small: true,
                      ),
                    formEntryField(w: w,
                        labelText: 'quantity',hint: 'Enter claim quantity',
                        onChange: (val) => setState(() => _email = val)),
                    formEntryField(w: w,
                        labelText: 'Confirm Password',hint: 'Confirm password',isPassword: true,
                        onChange: (val) => setState(() => _passwordConfirm = val)), //formSave("Save", onSave:_submitForm)
                     altButton(w: w, onPressed:_submitForm, text: "Submit")
                  ]))),
          closeIcon(onPressed: null)
        ]));
  }
}





