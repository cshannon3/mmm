
import 'package:delaware_makes/pages/home/components/count.dart';
import 'package:delaware_makes/pages/home/components/gallery.dart';
import 'package:delaware_makes/pages/home/components/intro.dart';
import 'package:delaware_makes/pages/home/components/maker_section.dart';
import 'package:delaware_makes/pages/home/components/request_section.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/state/platform_state.dart';
import 'package:flutter/material.dart';


class HomePageMain extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var platformInfo=locator<PlatformInfo>();
    Size s =MediaQuery.of(context).size;
    bool isMobile = platformInfo.checkMobile(s);
    return   Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            SizedBox(height:20),
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntroBlock(),
            ),
            SizedBox(height:10),
            Container(
              height:isMobile?250.0:250.0,
              child: CountsWidget()
              ),
            SizedBox(height:30),
            RequestSection(isMobile: isMobile,),
            SizedBox(height:30),
            MakerSection(isMobile: isMobile,),
          // DesignsPage(),
          //  Container( height: 50.0,
          //  width: double.infinity,
          //       child: formTitle("", underline:true),),
       // Gallery(w:s.width),
          SizedBox(height:100),
        Container(
          color:Colors.black,
          height: 150.0,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("If you have any questions, please contact us at:", style: TextStyle( color:Colors.white, fontSize: 16.0)),
                SizedBox(height:10),
                Text("delawaremakes@gmail.com", style: TextStyle( color:Colors.white, fontSize: 16.0))
            ],),
          )
        )
   
      ],
        ),
      );
  }
}

      // Widget title(String titleText)=>makeSliverHeader(
      //           Container( height: double.infinity,width: double.infinity,
      //              child:titleText==""?null: formTitle(titleText, underline:true),
      //           ),minH: 50.0, maxH: 50.0);
