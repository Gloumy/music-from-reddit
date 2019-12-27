import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/states/global_state.dart';
import 'package:redditify/utils/colors.dart';

class PlaySinglePostButton extends StatefulWidget {
  final Post post;

  const PlaySinglePostButton({
    Key key,
    this.post,
  }) : super(key: key);

  @override
  _PlaySinglePostButtonState createState() => _PlaySinglePostButtonState();
}

class _PlaySinglePostButtonState extends State<PlaySinglePostButton> {
  Post get _post => widget.post;

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
          Provider.of<GlobalState>(context).playSong(_post);
        },
      ),
    );
  }
}
