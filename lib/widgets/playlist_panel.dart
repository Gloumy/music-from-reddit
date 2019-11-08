import 'package:flutter/material.dart';
import 'package:redditify/presenters/player/playlist_title.dart';
import 'package:redditify/presenters/player/songs_list.dart';
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
          // Filler container to save some space for drag down
          Container(
            height: 15.0,
          ),
          PlaylistTitle(),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: SongsList(),
          ),
          Container(
            child: CollapsedPlayer(),
            height: 75.0,
          ),
        ],
      ),
    );
  }
}
