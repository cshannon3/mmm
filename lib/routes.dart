
import 'package:delaware_makes/pages/locations/loc2.dart';
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
    router.define(locations, handler: locRouterHandler);
    router.define(signIn, handler: signInHandler);
    router.define(signUp, handler: signUpHandler);
  }
}
var locRouterHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:MapsPage2(),currentRoute:"/map");
});

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


var adminHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:AdminPage(),currentRoute:"/admin");
    });
var usersHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return RootPage(screen:ProfilePage(),currentRoute:"/profile");
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


