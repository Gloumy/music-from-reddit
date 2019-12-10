import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/presenters/player/current_song_title.dart';
import 'package:redditify/presenters/player/player_controls.dart';
import 'package:redditify/states/player_state.dart';

class PlayerBottomSheet extends StatefulWidget {
  @override
  _PlayerBottomSheetState createState() => _PlayerBottomSheetState();
}

class _PlayerBottomSheetState extends State<PlayerBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyPlayerState>(
      builder: (context, state, _) {
        return Visibility(
          visible: state.isPlaying,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.5, color: Colors.blueGrey),
                bottom: BorderSide(width: 0.3, color: Colors.blueGrey),
              ),
            ),
            height: 50.0,
            margin: EdgeInsets.symmetric(horizontal: 2.0),
            padding: EdgeInsets.symmetric(horizontal: 7.0),
            child: Row(
              children: <Widget>[
                CurrentSongTitle(),
                VerticalDivider(
                  thickness: 3.0,
                ),
                PlayerControls(),
              ],
            ),
          ),
        );
      },
    );
  }
}
