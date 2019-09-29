import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/posts_state.dart';

class PostsCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsState>(
      builder: (context, state, _) {
        return Text("${state.postsLength} titres");
      },
    );
  }
}
