import 'package:flutter/material.dart';
import 'package:redditify/presenters/player/current_song_title.dart';
import 'package:redditify/presenters/player/player_controls.dart';
import 'package:redditify/presenters/player/song_progression_bar.dart';
import 'package:redditify/utils/colors.dart';

class CollapsedPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkGreyColor,
      ),
      child: Column(
        children: <Widget>[
          SongProgressionBar(),
          Expanded(
            child: Row(
              children: <Widget>[
                CurrentSongTitle(),
                VerticalDivider(
                  color: mediumGreyColor,
                  thickness: 3.0,
                ),
                PlayerControls(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
