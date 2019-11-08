import 'package:flutter/material.dart';
import 'package:redditify/utils/colors.dart';
import 'package:redditify/widgets/collapsed_player.dart';

class PlaylistPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkGreyColor,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Container(child: CollapsedPlayer(), height: 75.0,),
        ],
      ),
    );
  }
}
