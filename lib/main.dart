//import 'package:delaware_makes/apis/figma/figma_api.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:delaware_makes/apis/googleclient/gmanager/gmanager.dart';
import 'package:delaware_makes/routes.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/state/data_repo.dart';
import 'package:delaware_makes/state/docs_repo.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:delaware_makes/utils/secrets.dart' as secrets;




import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

// 
 


void main() async {
  setupLocator();
    final gmanager = GManager(secrets.credentials);
    var dataRepo = locator<DataRepo>();
    var docsRepo = locator<DocsRepo>();
    await dataRepo.initialize(gmanager: gmanager);
    await docsRepo.initialize(gmanager: gmanager);   
   
    var appState = locator<AppState>();
    appState.init();
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
 
    return  MaterialApp(
      title: 'Delaware Makes',
      debugShowCheckedModeBanner: false,
           theme: ThemeData(
             fontFamily: 'HelveticaNeue',
         //  .copyWith( bodyText1: GoogleFonts.oswald(), ),
      ),
      color: Colors.grey,
      routes: Routes.route(),
      onGenerateRoute: Application.router.generator,
   );
  }
}


//void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String _response = 'no response';
//   int _responseCount = 0;

//   @override
//   Widget build(BuildContext context) {
//     final HttpsCallable callable = CloudFunctions.instance
//         .getHttpsCallable(functionName: 'sendMail')
//           ..timeout = const Duration(seconds: 30);
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Cloud Functions example app'),
//         ),
//         body: Center(
//           child: Container(
//             margin: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
//             child: Column(
//               children: <Widget>[
//                 Text('Response $_responseCount: $_response'),
//                 MaterialButton(
//                   child: const Text('SEND REQUEST'),
//                   onPressed: () async {
//                     try {
//                       final HttpsCallableResult result = await callable.call(
//                         <String, dynamic>{
//                           'dest': 'crsemail3@gmail.com',
//                         },
//                       );
//                       print(result.data);
//                       setState(() {
//                         // _response = result.data[''];
//                         // _responseCount = result.data['repeat_count'];
//                       });
//                     } on CloudFunctionsException catch (e) {
//                       print('caught firebase functions exception');
//                       print(e.code);
//                       print(e.message);
//                       print(e.details);
//                     } catch (e) {
//                       print('caught generic exception');
//                       print(e);
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }