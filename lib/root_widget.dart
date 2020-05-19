//import 'package:delaware_makes/overlays/claims_form.dart';
//import 'package:delaware_makes/overlays/update_form.dart';
import 'package:delaware_makes/forms/form_manager.dart';
import 'package:delaware_makes/routes.dart';
import 'package:delaware_makes/service_locator.dart';//import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/shared_widgets/button_widgets.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/state/platform_state.dart';
import 'package:delaware_makes/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RootPage extends StatefulWidget {
  final Widget screen;
  final String currentRoute;


  RootPage({Key key, this.screen, this.currentRoute}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AppState appState; // CustomLoader loader;  //List designs;
  //PlatformInfo platformInfo = locator<PlatformInfo>();// = locator<PlatformInfo>();
  //String currentOverlay= "root";
   FormManager formManager;
  bool isFormActive=false;
  @override
  void initState() { // loader = CustomLoader();
    appState = locator<AppState>();
    if (!appState.isReady) {
      appState.getAll(); // print("Hello");
      appState.addListener(() {
        if (appState.isReady) {
          setState(() {});}  });
    }
     formManager= locator<FormManager>();
    formManager.addListener(() {
      if(isFormActive!=formManager.isActive)
      setState(() { 
        isFormActive=formManager.isActive;
      });
    });
    super.initState();
  }


  Widget bodyPadding(Widget screen, Size s) {
  double centerWidth = (s.width < 1140.0) ? s.width - 40.0 : 1100.0;
  return Container(//padding: EdgeInsets.all(20.0),
      child: Center(
        child: Container(
            width: centerWidth, height: double.infinity, child: screen),
      ));
}
  List<Widget> actionList(BuildContext context) {
    return appState.loggedIn
        ? [
            FlatButton(
              hoverColor:Colors.white.withOpacity(0.3),
                onPressed: () {
                  if ("/profile" != widget.currentRoute)
                  tappedMenuButton(context, "/profile");
                },
                child: Text(
                    safeGet(
                            map: appState.currentUser,
                            key: "displayName",
                            alt: "")
                        .toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 16.0)))
          ]
        : [
          MenuButton(name: "LOGIN", onPressed:() {
                 tappedMenuButton(context, "/login"); //platformInfo.setOverlay("login");//TODO 
                }),
          ];
  }

  menuButtonClicked(BuildContext context, String route) {  if (route != widget.currentRoute)tappedMenuButton(context, route); }

 //onMenuClicked()=>(route != widget.currentRoute ){  tappedMenuButton(context, route);  }
  appbar(BuildContext context, String currentRoute) => AppBar(
        backgroundColor: Colors.black,
        leading: Container(),
        title: InkWell(
          onTap: () { tappedMenuButton(context, "/"); },
          child: Text("DE Makes",
              style: GoogleFonts.merriweather(
                  textStyle: TextStyle(color: Colors.white, fontSize: 30.0))),
        ),
        actions: actionList(context),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
              height: 48.0,
              child: Row(
                children: <Widget>[
                  MenuButton(name: "Home", onPressed: ()=>menuButtonClicked(context, "/")),
                  MenuButton(name: "Locations", onPressed: ()=>menuButtonClicked(context, "/map")),
                  MenuButton(name: "About Us", onPressed: ()=>menuButtonClicked(context, "/aboutus")),
                  MenuButton(name: "Resources", onPressed: ()=>menuButtonClicked(context, "/designs")),
                  Expanded(
                    child: Container(),
                  ),
                 
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    Size s =  MediaQuery.of(context).size;

    return Scaffold(
      appBar: appbar(context, widget.currentRoute),
      body: (!appState.isReady)
          ? Center(child: CircularProgressIndicator())
          : Stack(
            children: <Widget>[
              bodyPadding(widget.screen, s),
              formManager.getOverlay()
            ],
          ),
    );
  }
}

    // PlatformInfo platformInfo = locator<PlatformInfo>();
    // platformInfo.screenSize = s;
    
 // platformInfo.bodyPadding(widget.screen,),
   // platformInfo.setOverlay(currentOverlay);
    // platformInfo.addListener(() {
    //  if(currentOverlay!=platformInfo.currentType)
    //   setState(() {
    //     currentOverlay=platformInfo.currentType;
    //   });
    // });

// MaterialButton(
//                       height: 40.0,
//                       minWidth: 80.0,

//                       onPressed: () {
//                         platformInfo.setOverlay("request");
                    
//                       },
//                       color: Colors.orangeAccent,
//                       textColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: new BorderRadius.circular(18.0)),
//                       child: Text("Request",
//                           style:
//                               TextStyle(color: Colors.white, fontSize: 20.0)),
//                     ),
//                   ),