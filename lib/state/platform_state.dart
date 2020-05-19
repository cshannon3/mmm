
import 'package:delaware_makes/forms/form_manager.dart';
import 'package:delaware_makes/forms/form_overlay.dart';
import 'package:delaware_makes/service_locator.dart';
//import 'package:delaware_makes/forms/form_model.dart';
//import 'package:delaware_makes/forms/forms.dart';
//import 'package:delaware_makes/service_locator.dart';
import 'package:flutter/material.dart';//import 'package:delaware_makes/pages/pages.dart';
//import 'app_state.dart';
import 'base_state.dart';

//import 'package:delaware_makes/state/app_state.dart';
// import 'package:delaware_makes/utils/utils.dart';

// import 'package:firebase/firebase.dart' as fb;
// import 'package:universal_html/prefer_universal/html.dart' as html;

enum PlatformType{
  MOBILE,
  DESKTOP
}

class PlatformInfo {//extends BaseState {
  Size _screenSize;
  Size _currentWidgetSize;
  PlatformType _platformType;//Widget _currentOverlay;
  bool refreshScreen=false;
  bool hasOverlay=false;
  PlatformInfo();
  //String _currentType="root";

  Size get screenSize => _screenSize;
  Size get size => _currentWidgetSize;
  PlatformType get platform => _platformType;
  double get w => _screenSize.width;
  double get h => _screenSize.height;
  //String get currentType => _currentType;

  set screenSize(Size size){
    _screenSize=size;
    _setPlatformType();
    //notifyListeners();
  }
  set widgetSize(Size size){
    _currentWidgetSize=size;
   // notifyListeners();
  }

  bool checkMobile(Size s){
    return s.width<650;
  }

  _setPlatformType(){
      _platformType = _screenSize.width<650?PlatformType.MOBILE:PlatformType.DESKTOP;
  }





}

