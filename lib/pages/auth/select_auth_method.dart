
import 'package:delaware_makes/routes.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/state/platform_state.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
 
  @override
  Widget build(BuildContext context) {
    //PlatformInfo platformInfo = locator<PlatformInfo>();
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey[200],
      child: Center(
        child: Container(
          width: 400.0,
          height:400.0,
           decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TitleText('Already Have an Account?', fontSize: 25,),
              SizedBox( height: 20,),
              MainUIButton(text: 'Sign In', 
                  onPressed: () { 
                    tappedMenuButton(context, "/signIn");
                    //platformInfo.setOverlay("signIn"); 
               },
                     ),
              SizedBox(height: 20),
              TitleText('Creating a New Account?',fontSize: 25,),
              SizedBox(height: 20),
              MainUIButton(text: 'Create account', 
                  onPressed: () {
                    tappedMenuButton(context, "/signUp");
                    //platformInfo.setOverlay("signUp");
                     }, ),
            ],
          ),
        ),
      ),
    );
  }




}
