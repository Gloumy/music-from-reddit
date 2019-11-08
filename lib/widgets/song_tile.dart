import 'package:flutter/material.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/utils/colors.dart';

class SongTile extends StatelessWidget {
  final Post song;
  final bool past;

  const SongTile({Key key, this.song, this.past = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
      child: Text(
        song.title,
        style: TextStyle(color: past ? mediumGreyColor : lightGreyColor),
      ),
    );
  }
}
