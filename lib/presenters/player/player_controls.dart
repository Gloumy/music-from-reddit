import 'package:flutter_exoplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/player_state.dart';
import 'package:redditify/utils/colors.dart';

class PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyPlayerState>(
      builder: (context, state, _) {
        return Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.skip_previous,
                  color: state.canPlayPrevious ? blueColor : mediumGreyColor,
                ),
                onTap: () => state.playPreviousSong(),
              ),
              if (state.audioPlayerState == PlayerState.PAUSED ||
                  !state.isPlaying)
                GestureDetector(
                  child: Icon(
                    Icons.play_arrow,
                    color: state.isPlaying ? blueColor : mediumGreyColor,
                  ),
                  onTap: () => state.resumeAudio(),
                ),
              if (state.audioPlayerState == PlayerState.PLAYING)
                GestureDetector(
                  child: Icon(
                    Icons.pause_circle_outline,
                    color: blueColor,
                  ),
                  onTap: () => state.pauseAudio(),
                ),
              GestureDetector(
                child: Icon(Icons.stop,
                    color: state.isPlaying ? blueColor : mediumGreyColor),
                onTap: () => state.stopAudio(),
              ),
              GestureDetector(
                child: Icon(
                  Icons.skip_next,
                  color: state.canPlayNext ? blueColor : mediumGreyColor,
                ),
                onTap: () => state.playNextSong(),
              ),
            ],
          ),
        );
      },
    );
  }
}
