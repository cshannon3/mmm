import 'package:de_makes_final/routes.dart';
import 'package:de_makes_final/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
 
  @override
  Widget build(BuildContext context) {
     double w= MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleText('Already Have an Account?', fontSize: 25,),
            SizedBox( height: 20,),
            altButton(w: w,text: 'Sign In', 
                onPressed: () { tappedMenuButton(context, "/signIn"); }, ),
            SizedBox(height: 20),
            TitleText('Creating a New Account?',fontSize: 25,),
            SizedBox(height: 20),
            altButton(w: w,text: 'Create account', 
                onPressed: () { tappedMenuButton(context, "/signUp"); }, ),
          ],
        ),
      ),
    );
  }
}
