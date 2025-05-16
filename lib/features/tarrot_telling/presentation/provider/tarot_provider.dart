import 'package:flutter/material.dart';

class TarotProvider  extends ChangeNotifier{
  int _chosenTarot = 0;
  int get chosenTarot => _chosenTarot;

  void changeTarot(int index) {
    _chosenTarot = index;
    notifyListeners();
  }
}