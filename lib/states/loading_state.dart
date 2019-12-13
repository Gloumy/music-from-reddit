import 'package:flutter/material.dart';

class LoadingState with ChangeNotifier {
  bool _isLoading = false;
  String _mainText = "Please wait ..";

  bool get isLoading => _isLoading;
  String get mainText => _mainText;

  void setBusy(bool value, {String mainText = "Please wait .."}) {
    _isLoading = value;
    _mainText = mainText;
    notifyListeners();
  }
}
