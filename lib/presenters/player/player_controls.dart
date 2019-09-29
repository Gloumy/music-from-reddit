import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/player_state.dart';

class PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerState>(
      builder: (context, state, _) {
        return Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                child: Icon(Icons.skip_previous),
                onTap: () => state.playPreviousSong(),
              ),
              if (state.audioPlayerState == AudioPlayerState.PAUSED)
                GestureDetector(
                  child: Icon(Icons.play_arrow),
                  onTap: () => state.resumeAudio(),
                ),
              if (state.audioPlayerState == AudioPlayerState.PLAYING)
                GestureDetector(
                  child: Icon(Icons.pause_circle_outline),
                  onTap: () => state.pauseAudio(),
                ),
              GestureDetector(
                child: Icon(Icons.stop),
                onTap: () => state.stopAudio(),
              ),
              GestureDetector(
                child: Icon(Icons.skip_next),
                onTap: () => state.playNextSong(),
              ),
            ],
          ),
        );
      },
    );
  }
}
