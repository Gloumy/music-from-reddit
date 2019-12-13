import 'package:flutter/material.dart';
import 'package:redditify/utils/colors.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: darkGreyColor,
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        padding: EdgeInsets.all(20.0),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
