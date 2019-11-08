import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/states/player_state.dart';

class SongsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerState>(
      builder: (context, state, _) {
        return ListView(
          children: <Widget>[
            for (Post song in state.playlist) Container(child: Text(song.title))
          ],
        );
      },
    );
  }
}
