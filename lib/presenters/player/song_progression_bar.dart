import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/player_state.dart';
import 'package:redditify/utils/colors.dart';

class SongProgressionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyPlayerState>(
      builder: (context, state, _) {
        return LinearProgressIndicator(
            backgroundColor: mediumGreyColor,
            valueColor: AlwaysStoppedAnimation<Color>(blueColor),
            value: (state.currentSongPosition != null &&
                    state.currentSongMaxDuration != null &&
                    state.currentSongPosition.inMilliseconds > 0 &&
                    state.currentSongPosition.inMilliseconds <
                        state.currentSongMaxDuration.inMilliseconds)
                ? (state.currentSongPosition.inMilliseconds /
                    state.currentSongMaxDuration.inMilliseconds)
                : 0.0);
      },
    );
  }
}
