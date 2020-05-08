import 'package:de_makes_final/overlays/claims_form.dart';
import 'package:de_makes_final/pages/auth/select_auth_method.dart';
import 'package:de_makes_final/pages/pages.dart';
import 'package:de_makes_final/root_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'overlays/overlays.dart';
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
  static String login = "/login";
  static String signIn = "/signIn";
  static String signUp = "/signUp";
  static String request = "/request";
  static String claim = "/claim";
  static String update = "/update";
  static String profile = "/profile";
  static String locations = "/map";
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
    router.define(login, handler: loginHandler);
    router.define(request, handler: requestHandler);
    router.define(claim, handler: claimHandler);
    router.define(update, handler: updateHandler);
    router.define(profile, handler: profileHandler);
    router.define(locations, handler: locationsRouteHandler);
    router.define(signIn, handler: signInHandler);
    router.define(signUp, handler: signUpHandler);
  }
}

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:HomePageMain(),currentRoute:"/");
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
var profileHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:ProfilePage(),currentRoute:"/profile");
});
var locationsRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:MapsPage(),currentRoute:"/map");
});

var requestHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:ClaimsForm(),currentRoute:"/request");
    });

var claimHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:ClaimsForm(),currentRoute:"/claim");
    });
var updateHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RootPage(screen:UpdateForm(),currentRoute:"/update");
    });



 // static String groups = "/groups";
  //static String designs = "/designs";
  //static String resources = "/resources";
  //static String needs = "/needs";

    //  if (pathElements[0] != '' || pathElements.length == 1) {
    //    return null;
    //  }
    //  switch (pathElements[1]) {
    //   case "WelcomePage":return CustomRoute<bool>(builder:(BuildContext context)=> WelcomePage()); 
    //   case "SignIn":return CustomRoute<bool>(builder:(BuildContext context)=> SignIn()); 
    //   case "SignUp":return CustomRoute<bool>(builder:(BuildContext context)=> Signup()); 
    //   case "ForgetPasswordPage":return CustomRoute<bool>(builder:(BuildContext context)=> ForgetPasswordPage()); 
    //   case "VerifyEmailPage":return CustomRoute<bool>(builder:(BuildContext context)=> VerifyEmailPage(),); 
    //   default:return onUnknownRoute(RouteSettings(name: '/Feature'));
    //  }










// class Routes{
//   static dynamic route(){
//       return {
//           '/': (BuildContext context) =>   SplashPage(),
//       };
//   }

//   static void sendNavigationEventToFirebase(String path) {
//     if(path != null && path.isNotEmpty){
//       // analytics.setCurrentScreen(screenName: path);
//     }
//   }

//   static Route onGenerateRoute(RouteSettings settings) {
//      final List<String> pathElements = settings.name.split('/');
//      if (pathElements[0] != '' || pathElements.length == 1) {
//        return null;
//      }
//      switch (pathElements[1]) {
//       case "WelcomePage":return CustomRoute<bool>(builder:(BuildContext context)=> WelcomePage()); 
//       case "SignIn":return CustomRoute<bool>(builder:(BuildContext context)=> SignIn()); 
//       case "SignUp":return CustomRoute<bool>(builder:(BuildContext context)=> Signup()); 
//       case "ForgetPasswordPage":return CustomRoute<bool>(builder:(BuildContext context)=> ForgetPasswordPage()); 
//       case "VerifyEmailPage":return CustomRoute<bool>(builder:(BuildContext context)=> VerifyEmailPage(),); 
//       default:return onUnknownRoute(RouteSettings(name: '/Feature'));
//      }
//   }

//    static Route onUnknownRoute(RouteSettings settings){
//      return MaterialPageRoute(
//           builder: (_) => Scaffold(
//                 appBar: AppBar(title: customTitleText(settings.name.split('/')[1]),centerTitle: true,),
//                 body: Center(
//                   child: Text('${settings.name.split('/')[1]} Comming soon..'),
//                 ),
//               ),
//         );
//    }
// }


// import 'package:fluro/fluro.dart';
// import 'package:flutter/material.dart';

// //import 'routes/routes.dart';

// class Application {
//   static Router router;
// }
// class Routes {
//   static String root = "/";
//   static String request = "/request";
//   static String groups = "/groups";
//   static String designs = "/designs";
//   static String resources = "/resources";
//   static String needs = "/needs";
//   static String signIn = "/signIn";
//   static String signUp = "/signUp";
//   static String profile = "/profile";
//   static String map = "/map";
//   static String goodvibes = "/goodvibes";
//   static String Root = "/Root";

//   static void configureRoutes(Router router) {
//     router.notFoundHandler = Handler(
//         handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//       print("ROUTE WAS NOT FOUND !!!");
//     });
//     router.define("/users/:id", handler: usersHandler);
//     router.define(root, handler: rootHandler);
//     router.define(request, handler: requestHandler);
//     // router.define(groups, handler: groupsRouteHandler);
//     // router.define(designs, handler: designsRouteHandler);
//     // router.define(resources, handler: resourcesRouteHandler);
//     // router.define(needs, handler: needsRouteHandler);
//     router.define(map, handler: covidMapRouteHandler);
//     router.define(Root, handler: RootRouteHandler);
//   }
// }
// var rootHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return HomePage();
// });
// var requestHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return RequestPage();
// });

// var RootRouteHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return RootPage();
// });
// var signInRouteHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return RootPage();
// });
// var signOutRouteHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return RootPage();
// });
// var forgetPasswordRouteHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return RootPage();
// });
// var editProfileRouteHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return RootPage();
// });
// var verifyEmailRouteHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return RootPage();
// });var profileRouteHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return RootPage();
// });

// var covidMapRouteHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return MapsPage();
// });


//   void tappedMenuButton(BuildContext context, String key) {
//     TransitionType transitionType = TransitionType.native;
//   //  String route = "/location";
//     Application.router
//         .navigateTo(context, key, transition: transitionType)
//         .then((result) {});
//   }

