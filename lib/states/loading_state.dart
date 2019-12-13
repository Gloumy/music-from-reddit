import 'package:flutter/material.dart';

class LoadingState with ChangeNotifier {
  bool _isLoading = false;
  String _mainText = "Please wait ..";
  String _subText = "";

  bool get isLoading => _isLoading;
  String get mainText => _mainText;
  String get subText => _subText;

  void setBusy(bool value,
      {String mainText = "Please wait ..", String subText = ""}) {
    _isLoading = value;
    _mainText = mainText;
    _subText = subText;
    notifyListeners();
  }
}
