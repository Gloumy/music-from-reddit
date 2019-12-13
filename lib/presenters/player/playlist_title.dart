import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/player_state.dart';
import 'package:redditify/utils/colors.dart';

class PlaylistTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyPlayerState>(
      builder: (context, state, _) => Text(
        state.playlist.title != null
            ? "r/${state.playlist.title}"
            : "No current playlist",
        style: TextStyle(
          color: redditOrange,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
