import 'package:flutter/material.dart';

class CounterProviderModel with ChangeNotifier {
  int _number = 0;
  int get number => _number;
  void incrementNum() {
    _number++;
    notifyListeners();
  }
}
