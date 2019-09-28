import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/global_state.dart';
import 'package:redditify/states/posts_state.dart';

class PlayPostsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsState>(
      builder: (context, state, _) {
        return Visibility(
          visible: state.posts.isNotEmpty,
          child: FloatingActionButton(
            child: Icon(Icons.playlist_play),
            onPressed: () => Provider.of<GlobalState>(context).playSongList(),
          ),
        );
      },
    );
  }
}
