import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/global_state.dart';
import 'package:redditify/utils/colors.dart';

class PlaySinglePostButton extends StatefulWidget {
  final String url;
  final String title;

  const PlaySinglePostButton({
    Key key,
    this.url,
    this.title,
  }) : super(key: key);

  @override
  _PlaySinglePostButtonState createState() => _PlaySinglePostButtonState();
}

class _PlaySinglePostButtonState extends State<PlaySinglePostButton> {
  String get _youtubeUrl => widget.url;
  String get _title => widget.title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        child: Icon(
          // _playing ? Icons.pause_circle_outline : Icons.play_circle_outline),
          Icons.play_circle_outline, color: blueColor,
        ),
        onTap: () {
          Provider.of<GlobalState>(context).playSong(_youtubeUrl, _title);
        },
      ),
    );
  }
}
