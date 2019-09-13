import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/posts_state.dart';

class PostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsState>(
      builder: (context, state, _) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.posts.length,
          itemBuilder: (context, index) {
            return Text(state.posts[index].title);
          },
        );
      },
    );
  }
}
