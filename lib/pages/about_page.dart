
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/utils/utils.dart';
import 'package:flutter/material.dart';
class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState state =  locator<AppState>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:20.0, vertical: 40.0),
      child:  toListText(
              safeGet(key:"AboutUs", map:state.docsRepo.doc.sections, alt:""))
      

    );
   
  }
}

