import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/presenters/player/current_song_title.dart';
import 'package:redditify/presenters/player/player_controls.dart';
import 'package:redditify/states/player_state.dart';

class PlayerBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerState>(
      builder: (context, state, _) {
        return Visibility(
          visible: state.isPlaying,
          child: BottomSheet(
            enableDrag: false,
            onClosing: () {},
            builder: (context) {
              return Container(
                height: 50.0,
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                padding: EdgeInsets.symmetric(horizontal: 7.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0))),
                child: Row(
                  children: <Widget>[
                    CurrentSongTitle(),
                    VerticalDivider(
                      thickness: 3.0,
                    ),
                    PlayerControls(),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
