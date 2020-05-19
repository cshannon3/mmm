
import 'package:delaware_makes/pages/home/components/count.dart';
import 'package:delaware_makes/pages/home/components/gallery.dart';
import 'package:delaware_makes/pages/home/components/intro.dart';
import 'package:delaware_makes/pages/home/components/maker_section.dart';
import 'package:delaware_makes/pages/home/components/request_section.dart';
import 'package:delaware_makes/routes.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/shared_widgets/sliver.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/state/platform_state.dart';
import 'package:delaware_makes/utils/utils.dart';
import 'package:flutter/material.dart';


class HomePageMain extends StatelessWidget {

      // Widget title(String titleText)=>makeSliverHeader(
      //           Container( height: double.infinity,width: double.infinity,
      //              child:titleText==""?null: formTitle(titleText, underline:true),
      //           ),minH: 50.0, maxH: 50.0);

  @override
  Widget build(BuildContext context) {
    var platformInfo=locator<PlatformInfo>();
    bool isMobile = platformInfo.checkMobile(MediaQuery.of(context).size);
    return   Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntroBlock(),
            ),
            RequestSection(isMobile: isMobile,),
            MakerSection(isMobile: isMobile,),
          // DesignsPage(),
           Container( height: 50.0,
           width: double.infinity,
                child: formTitle("DE Community Contributions", underline:true),),

          Container(
            height: 1000.0,
            child: Gallery()),
          sizedBox(height:100),
   
      ],
        ),
      );
  }
}
