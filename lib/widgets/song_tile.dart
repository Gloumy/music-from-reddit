import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/models/playlist_item.dart';
import 'package:redditify/states/player_state.dart';
import 'package:redditify/utils/colors.dart';

class SongTile extends StatelessWidget {
  final PlaylistItem song;
  final PlaylistItemStatus status;
  final int index;

  const SongTile({
    Key key,
    this.song,
    this.status,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;

    switch (status) {
      case PlaylistItemStatus.PENDING:
        color = lightGreyColor;
        break;
      case PlaylistItemStatus.PLAYING:
        color = redditOrange;
        break;
      case PlaylistItemStatus.PLAYED:
        color = mediumGreyColor;
        break;
      case PlaylistItemStatus.ERROR:
        color = Colors.red;
        break;
      default:
        print("Unrecognized status");
    }

    return GestureDetector(
      onTap: () => Provider.of<MyPlayerState>(context).jumpToSong(index),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
        child: Text(
          song.title,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
