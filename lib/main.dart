//import 'package:de_makes_final/apis/figma/figma_api.dart';
import 'package:de_makes_final/routes.dart';
import 'package:de_makes_final/service_locator.dart';
import 'package:de_makes_final/state/app_state.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  var appState = locator<AppState>();
  await appState.initialize();
  // var dataRepo = locator<DataRepo>();
  // await dataRepo.initializeDummy();
  //var api = FigmaApiGenerator(BrowserClient(), "44085-6531a416-b1ea-4f24-a649-3031f18a49d0");
  //print(await api.getFile("02gsUbzP8MwIfSvFBHuil7"));
  runApp(AppComponent());
}

class AppComponent extends StatefulWidget {
  @override
  State createState() {
    return AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  
  @override
  Widget build(BuildContext context) {
 
    return
  
      MaterialApp(
      title: 'DE Makes',
      debugShowCheckedModeBanner: false,
           theme: ThemeData(
          textTheme: GoogleFonts.merriweatherTextTheme().copyWith(
            bodyText1: GoogleFonts.oswald(),
          ),
      ),
      color: Colors.grey,
      routes: Routes.route(),
      onGenerateRoute: Application.router.generator,
   );
  }
}


//import 'package:delaware_makes/models/organization/org_data.dart';
// import 'package:fluro/fluro.dart';
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }

 //  final app = 
  //  MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider<AppState>(create: (_) => AppState()),
  //       ChangeNotifierProvider<AuthState>(create: (_) => AuthState()),
  //     ],child: )



//void main() async {
  
   //var _db = Firestore.instance;
    // orgJson.forEach((key, value) { 
    //   saveToFirebase(collectionName: "orgs", itemMap: value);
    // });
     

    

// class MyApp extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<AppState>(create: (_) => AppState()),
//         ChangeNotifierProvider<AuthState>(create: (_) => AuthState()),
      
//       ],
//       child: MaterialApp(
//         title: 'Fwitter',
//         theme: AppTheme.apptheme.copyWith(
//           textTheme: GoogleFonts.muliTextTheme(
//             Theme.of(context).textTheme,
//           ),
//         ),
//         debugShowCheckedModeBanner: false,
//         routes: Routes.route(),
//         onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
//         onUnknownRoute: (settings) => Routes.onUnknownRoute(settings),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   MyApp();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
  
//       //showPerformanceOverlay: true,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//  // int numScreens= 4;
//  @override
//   void initState() {
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
      
//       body:Container(color: Colors.black,)
//        );
//   }
// }

//   // saveToFirebase({@required String collectionName, dynamic item, Map itemMap}) async{
//   //   Map m = itemMap??item.toMap();
//   //   await Firestore.instance
//   //         .collection(collectionName)
//   //         .document(m["name"])
//   //         .setData(m);
//   // }

//     // var orgRepo = locator<OrgRepo>();
   
//     // Firestore.instance.collection("orgs").snapshots().listen((onData) {
//     //     onData.documents.forEach((dataItem) {
//     //       try{
//     //         Organization org = Organization.fromJson(dataItem.data);
            
//     //         if (org.linkedData.containsKey("requests")){
//     //               org.linkedData["requests"].forEach((r){
//     //                 if(reqsData.containsKey(r)){
//     //                   Request u = Request.fromJson(reqsData[r]);
//     //                 //  print(u.quantityRecieved);
//     //                   org.requests.add(u);
//     //                 }
//     //                 });}
//     //              print(org.name);
//     //         orgRepo.orgs.add(org);     
//     //       }catch (e){
          
//     //       }
//     //     });
//     //   });


