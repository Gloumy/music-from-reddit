import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/global_state.dart';
import 'package:redditify/states/player_state.dart';

class PlayerActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerState>(builder: (context, state, _) {
      return FloatingActionButton(
        child: state.isPlaying ? Icon(Icons.stop) : Icon(Icons.playlist_play),
        onPressed: () => state.isPlaying
            ? Provider.of<GlobalState>(context).stopAudio()
            : Provider.of<GlobalState>(context).playSongList(),
      );
    });
  }
}
