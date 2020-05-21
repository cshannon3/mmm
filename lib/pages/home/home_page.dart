
import 'package:delaware_makes/pages/home/components/count.dart';
import 'package:delaware_makes/pages/home/components/intro.dart';
import 'package:delaware_makes/pages/home/components/maker_section.dart';
import 'package:delaware_makes/pages/home/components/request_section.dart';
import 'package:delaware_makes/service_locator.dart';
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
            
           IntroBlock(isMobile: isMobile,),
            SizedBox(height:30),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal:isMobile?5.0:30.0),
            //   child: Container(
            //     height:isMobile?250.0:250.0,
            //     child: CountsWidget(isMobile: isMobile,)
            //     ),
            // ),
            SizedBox(height:30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:isMobile?5.0:30.0),
              child: RequestSection(isMobile: isMobile,),
            ),
            SizedBox(height:30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:isMobile?5.0:30.0),
              child: MakerSection(isMobile: isMobile,),
            ),
            
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

          // DesignsPage(),
          //  Container( height: 50.0,
          //  width: double.infinity,
          //       child: formTitle("", underline:true),),
       // Gallery(w:s.width),