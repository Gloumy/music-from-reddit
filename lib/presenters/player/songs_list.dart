import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/player_state.dart';
import 'package:redditify/utils/colors.dart';
import 'package:redditify/widgets/song_tile.dart';

class SongsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyPlayerState>(
      builder: (context, state, _) {
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: mediumGreyColor,
          ),
          itemCount: state.playlist.songs.length,
          itemBuilder: (context, index) {
            return SongTile(
              song: state.playlist.songs[index],
              status: state.playlist.songs[index].status,
              index: index,
            );
          },
        );
      },
    );
  }
}
