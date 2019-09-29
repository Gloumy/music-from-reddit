import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/presenters/player/player_action_button.dart';
import 'package:redditify/states/posts_state.dart';

class PlayerButtonVisibility extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsState>(
      builder: (context, state, _) {
        return Visibility(
          visible: state.posts.isNotEmpty,
          child: PlayerActionButton(),
        );
      },
    );
  }
}
