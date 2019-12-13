import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:redditify/utils/colors.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            color: darkGreyColor,
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SpinKitWave(
              type: SpinKitWaveType.start,
              duration: Duration(milliseconds: 1500),
              size: 50,
              color: redditOrange,
            ),
            Text(
              "Please wait ..",
              style: TextStyle(color: lightGreyColor),
            )
          ],
        ),
      ),
    );
  }
}
