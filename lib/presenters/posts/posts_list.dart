import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_assist/base_view.dart';
import 'package:redditify/states/posts_state.dart';
import 'package:redditify/states/global_state.dart';

class PostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<PostsState>(
      model: Provider.of<GlobalState>(context).postsState,
      builder: (context, state, _) {
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            shrinkWrap: true,
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              return Text(
                state.posts[index].title,
              );
            },
          ),
        );
      },
    );
  }
}
