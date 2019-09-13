import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/presenters/posts/posts_list.dart';
import 'package:redditify/presenters/posts/posts_loading_button.dart';
import 'package:redditify/states/posts_state.dart';

class HomePage extends StatelessWidget {
  final List<String> _subreddits = const ["metalcore", "metal", "deathcore"];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostsState>(
      builder: (context) => PostsState(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Redditify"),
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            for (String subreddit in _subreddits)
              PostsLoadingButton(
                subreddit: subreddit,
              ),
            PostsList(),
          ],
        ),
      ),
    );
  }
}
