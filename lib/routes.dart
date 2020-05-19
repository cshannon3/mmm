
import 'package:delaware_makes/pages/pages.dart';
import 'package:delaware_makes/root_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
//import 'routes/routes.dart';
  void tappedMenuButton(BuildContext context, String key) {
    TransitionType transitionType = TransitionType.fadeIn;
    Application.router
        .navigateTo(context, key, transition: transitionType)
        .then((result) {});
  }

class Application {
  static Router router;
}
class Routes {
  static String root = "/";
  static String profile = "/profile";
  static String aboutUs= "/aboutus";
  static String admin= "/admin";
  static String designs= "/designs";
  static String id= "users/:id";
  static String locations = "/map";
  static String login = "/login";
  static String signIn = "/signIn";
  static String signUp = "/signUp";
  static String datastruct = "/datastruct";

  static dynamic route(){
      return {
          '/': (BuildContext context) =>   RootPage(screen:HomePageMain(), currentRoute: "/",),
      };
  }

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      
    });
    router.define(root, handler: rootHandler);
    router.define(admin, handler: adminHandler);
    router.define(login, handler: loginHandler);
    router.define(profile, handler: profileHandler);
    router.define(designs, handler: designsHandler);
    router.define(id, handler: usersHandler);
    router.define(aboutUs, handler: aboutUsHandler);
    router.define(locations, handler: locationsRouteHandler);
    router.define(signIn, handler: signInHandler);
    router.define(signUp, handler: signUpHandler);
  }
}

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:HomePageMain(),currentRoute:"/");
});

var profileHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:ProfilePage(),currentRoute:"/profile");
});
var designsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:DesignsPage(),currentRoute:"/designs");
});
var aboutUsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:AboutUsPage(),currentRoute:"/aboutus");
});

var locationsRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:MapsPage(),currentRoute:"/map");
});


var adminHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:AdminPage(),currentRoute:"/admin");
    });
var usersHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return RootPage(screen:ProfilePage(),currentRoute:"/profile");
// UsersScreen(params["id"][0]);
});
var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:WelcomePage(),currentRoute:"/login");
});
var signInHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:SignIn(),currentRoute:"/signIn");
});
var signUpHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:Signup(),currentRoute:"/signUp");
});





//  static String login = "/login";
  // static String signIn = "/signIn";
  // static String signUp = "/signUp";
 // static String request = "/request";
  //static String claim = "/claim";
 // static String update = "/update";

    //router.define(login, handler: loginHandler);
    //router.define(request, handler: requestHandler);
   //router.define(claim, handler: claimHandler);

     //router.define(update, handler: updateHandler);




// var requestHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return RootPage(screen:RequestPage(),currentRoute:"/request");
//     });

// var claimHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return RootPage(screen:ClaimsForm(),currentRoute:"/claim");
//     });
// var updateHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return RootPage(screen:UpdateForm(),currentRoute:"/update");
//     });