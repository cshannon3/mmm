import 'package:flutter/material.dart';

class BaseState extends ChangeNotifier{
 
  bool _isBusy;
  bool get isbusy => _isBusy;
  set loading(bool value){
    _isBusy = value;
    notifyListeners();
  }

}
