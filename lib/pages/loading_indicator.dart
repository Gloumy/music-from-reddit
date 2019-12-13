import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
