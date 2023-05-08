import 'package:flutter/widgets.dart';

class SliderProviderModel with ChangeNotifier {
  double _val = 1.0;
  double get val => _val;
  void setNewValue(double val) {
    _val = val;
    notifyListeners();
  }
}
