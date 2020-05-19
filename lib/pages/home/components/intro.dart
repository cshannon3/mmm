
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/sliver.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/utils/utils.dart';
import 'package:flutter/material.dart';

class IntroBlock extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AppState state =  locator<AppState>();
    return Container(
      height:200.0,
       color: Colors.grey[200],
      child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text("Welcome to DE Makes",
                    overflow: TextOverflow.clip,
                    style: TextStyle(color: Colors.black, fontSize: 22.0)),
              ),
            //  Expanded(
                 // child:
                 SizedBox(height: 20.0,),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                   // child: Center(
                child: 
                      toRichText(safeGet(key:"Intro", map:state.docsRepo.doc.sections, alt:""))
              ),
                  //)
            //      ),
            ],
  //  )))
      ),
    );
  }
}

// SliverPersistentHeader(
//         pinned: false,
//         delegate: SliverAppBarDelegate(
//             minHeight:   130.0,maxHeight: 180.0, child: Container(
//         color: Colors.grey[200],
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//         child: 

  //double width;
 // String topHeader = ""; 
 // String decription = "";
