import 'package:de_makes_final/overlays/claims_form.dart';
import 'package:de_makes_final/overlays/update_form.dart';
import 'package:de_makes_final/routes.dart';
import 'package:de_makes_final/service_locator.dart';
import 'package:de_makes_final/state/app_state.dart';
import 'package:de_makes_final/state/auth_state.dart';
import 'package:de_makes_final/utils/utility.dart';
import 'package:flutter/material.dart';

Widget bodyPadding({double width = 800.0, Widget screen}) {
  double centerWidth = (width < 1140.0) ? width - 40.0 : 1100.0;
  return Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Container(
            width: centerWidth, height: double.infinity, child: screen),
      ));
}


class RootPage extends StatelessWidget {
  final Widget screen;
  final String currentRoute;

  RootPage({Key key, this.screen, this.currentRoute}) : super(key: key);

  List<Widget> actionList(BuildContext context) {
     var state = locator<AppState>();
    return state.loggedIn
        ? [
           FlatButton(
                onPressed: () {
                  if ("/profile" != currentRoute)
                    tappedMenuButton(context, "/profile");
                },
                child: Text( safeGet(map:state.currentUser, key:"displayName", alt:"").toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 16.0)))

          ]
        : [
            FlatButton(
                onPressed: () {
                  if ("/login" != currentRoute)
                    tappedMenuButton(context, "/login");
                },
                child: Text("LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 16.0)))
          ];
  }

  Widget menuButton(BuildContext context, String name, String route) =>
      FlatButton(
          onPressed: () {
            if (route != currentRoute) tappedMenuButton(context, route);
          },
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          ));

  appbar(BuildContext context, String currentRoute) => AppBar(
        backgroundColor: Colors.black,
        leading: Container(),
        title: InkWell(
          onTap: () {},
          child: Text("DE Makes",
              style: TextStyle(color: Colors.white, fontSize: 30.0)),
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
                  menuButton(context, "Home", "/"),
                  menuButton(context, "Locations", "/map"),
                  menuButton(context, "About Us", "/aboutus"),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: MaterialButton(
                      height: 40.0,
                      minWidth: 80.0,
                      onPressed: () {
                     //   launch("https://forms.gle/DBqWCo3oYw1drCc37");
                           tappedMenuButton(context, "/request");
                      },
                      color: Colors.orangeAccent,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0)),
                      child: Text("Request",
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

 

  @override
  Widget build(BuildContext context) {
     var state = locator<AppState>();
    Size s = MediaQuery.of(context).size;
    return 
    Scaffold(
      appBar: appbar(context,currentRoute),
      body: //state.isbusy? Center(child:CircularProgressIndicator()):
      Stack(
        children: [
          bodyPadding(width: s.width, screen: screen),
          state.overlay=="claim"?ClaimsForm():   // s:overlay
          state.overlay=="update"?UpdateForm():
          Container()  
        ],
      ),
    );
  }
}

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     state.authState.userModel.displayName,
            //     style: TextStyle(color: Colors.white),
            //   ),
            // )
 // s)overlay
        //  state.overlay=="request"?overlay(RequestsP, s):

          // Overlay

   // Widget overlay(Widget overlayWidget, Size s){
    //   return Container(
    //     child: Center(
    //       child: FractionallySizedBox(

    //       ),
    //     ),
    //   );
    // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   state = locator<AuthState>();
  //   busyStatus=state.isbusy;
  //   super.initState();
  //   state.addListener(() {
  //     print("state");
  //     if(state.isbusy!=busyStatus){
  //       busyStatus=state.isbusy;
  //    // print(state.userModel.displayName);
  //     setState(() {});
  //     }
  //   });
  // }


// Spacer(),
// Expanded(
//   child: Container(),
// ),
// Padding(
//     padding: EdgeInsets.symmetric(horizontal: 20.0),
//     child: topButton("Request", h: 40,
//     onPressed: () {
//       launch(
//           "https://forms.gle/DBqWCo3oYw1drCc37"); //   tappedMenuButton(context, "/request");
//     })),

// FlatButton(
//     onPressed: () {
//       if ("/map" != currentRoute)
//         tappedMenuButton(context, "/map");
//     },
//     child: Text(
//       "Map",
//       style: TextStyle(color: Colors.white),
//     )),

// FlatButton(
//     onPressed: () {
//       if ("/" != currentRoute) tappedMenuButton(context, "/");
//     },
//     child: Text(
//       "Home",
//       style: TextStyle(color: Colors.white),
//     )),
// AppBar appbar(BuildContext context, String currentRoute)=> AppBar(
//         backgroundColor: Colors.black,
//         //title: //Component1(),
//         title: InkWell(
//           onTap: () {

//           },
//           child: Text("DE Makes",
//               style: GoogleFonts.merriweather(
//                   textStyle: TextStyle(color: Colors.white, fontSize: 30.0))),
//         ),
//         actions: <Widget>[
//         FlatButton( onPressed:(){if("/login"!=currentRoute)tappedMenuButton(context, "/login");},
//          child: Text("LOGIN",
//               style: GoogleFonts.merriweather(
//                   textStyle: TextStyle(color: Colors.white, fontSize: 16.0)))
//         )
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(48.0),
//           child: Theme(
//             data: Theme.of(context).copyWith(accentColor: Colors.white),
//             child: Container(
//               height: 48.0,
//               child: Row(
//                 children: <Widget>[
//                 FlatButton(onPressed:(){if("/"!=currentRoute)tappedMenuButton(context, "/");},
//                  child: Text("Home", style: TextStyle(color:Colors.white),)),

//                    FlatButton(onPressed:(){ if("/map"!=currentRoute)tappedMenuButton(context, "/map");},
//                  child: Text("Map", style: TextStyle(color:Colors.white),)),
//               Expanded(child: Container(),),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: MaterialButton(
//                           height: 40.0,
//                           minWidth: 80.0,
//                           onPressed: (){
//                             launch("https://forms.gle/DBqWCo3oYw1drCc37");
//                          //   tappedMenuButton(context, "/request");
//                             },
//                           color: Colors.orangeAccent,
//                           textColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: new BorderRadius.circular(18.0)),
//                           child: Text("Request",
//                               style:  TextStyle(color: Colors.white, fontSize: 20.0)),
//                         ),
//               ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );

//  MaterialButton(
//           height: 40.0,
//           minWidth: 80.0,
//           onPressed: (){
//             launch("https://forms.gle/DBqWCo3oYw1drCc37");  //   tappedMenuButton(context, "/request");
//             },
//           color: Colors.orangeAccent,
//           textColor: Colors.white,
//           shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(18.0)),
//           child: Text("Request",
//               style:  TextStyle(color: Colors.white, fontSize: 20.0)),
//         ),
