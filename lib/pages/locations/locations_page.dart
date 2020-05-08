
import 'package:de_makes_final/pages/locations/map_widget.dart';
import 'package:de_makes_final/pages/locations/org_tile.dart';
import 'package:de_makes_final/service_locator.dart';
import 'package:de_makes_final/state/app_state.dart';
import 'package:de_makes_final/utils/utility.dart';

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

//https://dev.to/happyharis/flutter-web-google-maps-381a
//https://medium.com/funwithflutter/flutter-web-importing-html-and-javascript-flutter-1-9-c728ae9eaf2f
//https://pub.dev/packages/universal_html
//http://kml4earth.appspot.com/icons.html


class MapsPage extends StatefulWidget {

  const MapsPage({Key key,}) : super(key: key);
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
 String activeOrgID;
  var appState = locator<AppState>();
 
  @override
  Widget build(BuildContext context) {
   
    List orgsData = appState.dataRepo.getModelsData("orgs");
    return
         isMobile(MediaQuery.of(context).size.width)
            ?   optionsBar(orgsData):
              Row(children: [
              mapWidget(orgsData),
              optionsBar(orgsData)
               ],);
  }
   Widget optionsBar(List orgsData) => Expanded(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            Container(
              height: 50.0,
              width: double.infinity,
              child: Center(
                child: Text("Requests",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        decoration: TextDecoration.underline)),
              ),
            ),
            Expanded(
                // TODO figure out categories, requests
                child: //categoryTile("categoryName")
                ListView(
                     children: 
                     
          orgsData.map((pl) => OrgTile(
                orgData:  pl,
              ))
          .toList())
           
                        )
          ]),
        ),
      );




  Widget mapWidget(List orgsData) =>Expanded(child: 
  Container(
            height: 500.0,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(60.0)),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                GoogleMap(
                 orgsData:orgsData
                ),
              
              ],
            ))
      );
}

// Widget left()=> Expanded(
//         child:Column(
//           children:[
//              Container(
//             height: 100.0,
//             width: double.infinity,color: Colors.yellow,),
//             mapWidget()
//           ]
//         )
//         );

  // clickPlace(String p) {
  //   activeOrgID = p;
  // }

         // .where((p) => locCats[categoryName].contains(p.orgType))
 //places: orgRepo.getOrgs(),
                  //widget.dataController.listOf("organizations"),
                //  clickPlace: clickPlace,

  // activePlace != null
                //     ? Center(
                //         child: Container(
                //           height: 400.0,
                //           width: 400.0,
                //           decoration: BoxDecoration(
                //               color: Colors.grey[300],
                //               borderRadius: BorderRadius.circular(60.0)),
                //         ),
                //       )
                //     : Container()