import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/global_state.dart';
import 'package:redditify/states/player_state.dart';
import 'package:redditify/states/subreddits_state.dart';
import 'package:redditify/utils/colors.dart';

class PlayerActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyPlayerState>(builder: (context, state, _) {
      return FloatingActionButton(
        backgroundColor: blueColor,
        child: state.isPlaying &&
                state.playlist.title ==
                    Provider.of<SubredditsState>(context).selectedSubreddit
            ? Icon(
                Icons.stop,
                color: lightGreyColor,
              )
            : Icon(
                Icons.playlist_play,
                color: lightGreyColor,
              ),
        onPressed: () => state.isPlaying &&
                state.playlist.title ==
                    Provider.of<SubredditsState>(context).selectedSubreddit
            ? Provider.of<GlobalState>(context).stopAudio()
            : Provider.of<GlobalState>(context).playSongList(),
      );
    });
  }
}
