import 'package:flutter/material.dart';

class ZodiacProvider with ChangeNotifier {
  int _selectedZodiacIndex = 0;

  int get selectedZodiacIndex => _selectedZodiacIndex;

  void setSelectedZodiac(int index) {
    _selectedZodiacIndex = index;
    notifyListeners();
  }
}