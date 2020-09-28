import 'package:flutter/material.dart';

class BaseViewModel with ChangeNotifier{
  bool isLoding = false;

  void loding(bool loding){
    this.isLoding = loding;
    notifyListeners();
  }
}