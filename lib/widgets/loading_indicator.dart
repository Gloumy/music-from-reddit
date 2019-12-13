import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/loading_state.dart';
import 'package:redditify/utils/colors.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingState>(
      builder: (context, state, _) {
        return Visibility(
          visible: state.isLoading,
          child: Center(
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: darkGreyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  border: Border.all(color: mediumGreyColor, width: 2)),
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
                    state.mainText,
                    style: TextStyle(color: lightGreyColor),
                  ),
                  Text(
                    state.subText,
                    style: TextStyle(color: lightGreyColor),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
