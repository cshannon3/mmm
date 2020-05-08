
import 'package:de_makes_final/shared_widgets/sliver.dart';
import 'package:de_makes_final/static_content.dart';
import 'package:de_makes_final/utils/utility.dart';
import 'package:flutter/material.dart';


class IntroBlock extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: false,
        delegate: SliverAppBarDelegate(
            minHeight:   100.0,maxHeight: 160.0, child: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("Welcome to DE Makes",
                  overflow: TextOverflow.clip,
                  style: TextStyle(color: Colors.black, fontSize: 22.0)),
            ),
            Expanded(
                child: Center(
              child: 
                  toRichText(siteContent["Opening"]),
            )),
          ],
    ))));
  }
}


  //double width;
 // String topHeader = ""; 
 // String decription = "";
