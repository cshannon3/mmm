
import 'package:de_makes_final/pages/home/home_widgets/count.dart';
import 'package:de_makes_final/pages/home/home_widgets/designs_tab.dart';
import 'package:de_makes_final/pages/home/intro.dart';
import 'package:de_makes_final/shared_widgets/sliver.dart';
import 'package:flutter/material.dart';

class HomePageMain extends StatefulWidget {
  final bool about;

  const HomePageMain({Key key, this.about = false}) : super(key: key);
  @override
  _HomePageMainState createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {

  String selected = "Designs";
  //Design activeDesign;
  //Widget activeWidget=DesignsPage();
  //DesignsPage();
  Widget overlayWidget = Container();
  bool formOpen = false;
  bool infoOpen = false;

  Widget mainPage(double w) => Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomScrollView(
          slivers: <Widget>[
            IntroBlock(),
            CountsWidget(w: w),
            makeSliverHeader(
            mainMyTabs(width: w,
              selected: selected,
              items: {
                "Designs":(){setState(() {selected="Designs";
                //activeWidget=DesignsPage();
                //DesignsPage(); 
                });},
                "Groups":(){setState(() {selected="Groups";
               // activeWidget=LocationsPage(); 
                });},
                "Gallery":(){setState(() {
                  selected="Gallery";
                 // activeWidget=Container(color:Colors.blue,);
                  //GalleryPage(); 
                  });},
              }
            ), minH: 60.0, maxH: 80.0, pinned: true),
           DesignsPage(),
          //  activeWidget,
            makeSliverHeader(
                Container(
                  height: double.infinity,
                  width: double.infinity,
                ),
                minH: 50.0,
                maxH: 80.0),
          ],
        ),
      );



  Widget header(String h) => Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Center(
            child: Text(
          h,
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        )),
      );
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return //widget.dataController.isLoading?Center(child: CircularProgressIndicator(),):
        Stack(
      children: <Widget>[
        mainPage(w),
      ],
    );
  }
}
