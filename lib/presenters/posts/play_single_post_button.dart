import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/global_state.dart';

class PlaySinglePostButton extends StatefulWidget {
  final String url;

  const PlaySinglePostButton({Key key, this.url}) : super(key: key);

  @override
  _PlaySinglePostButtonState createState() => _PlaySinglePostButtonState();
}

class _PlaySinglePostButtonState extends State<PlaySinglePostButton> {
  String get _youtubeUrl => widget.url;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        child: Icon(
            // _playing ? Icons.pause_circle_outline : Icons.play_circle_outline),
            Icons.play_circle_outline),
        onTap: () {
          Provider.of<GlobalState>(context).playSong(_youtubeUrl);
        },
      ),
    );
  }
}
