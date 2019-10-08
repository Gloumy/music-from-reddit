import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/global_state.dart';
import 'package:redditify/states/player_state.dart';
import 'package:redditify/states/subreddits_state.dart';

class PlayerActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerState>(builder: (context, state, _) {
      return RaisedButton.icon(
        icon: state.isPlaying &&
                state.playlistName ==
                    Provider.of<SubredditsState>(context).selectedSubreddit
            ? Icon(
                Icons.stop,
                color: Colors.red,
              )
            : Icon(Icons.playlist_play),
        label: state.isPlaying &&
                state.playlistName ==
                    Provider.of<SubredditsState>(context).selectedSubreddit
            ? Text("Stop")
            : Text("Play all"),
        onPressed: () => state.isPlaying &&
                state.playlistName ==
                    Provider.of<SubredditsState>(context).selectedSubreddit
            ? Provider.of<GlobalState>(context).stopAudio()
            : Provider.of<GlobalState>(context).playSongList(),
      );
    });
  }
}
