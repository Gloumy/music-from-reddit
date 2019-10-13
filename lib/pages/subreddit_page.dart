import 'package:flutter/material.dart';
import 'package:redditify/presenters/player/player_button_visibility.dart';
import 'package:redditify/presenters/posts/posts_count.dart';
import 'package:redditify/presenters/posts/posts_list.dart';
import 'package:redditify/presenters/subreddits/subreddit_header.dart';
import 'package:redditify/presenters/subreddits/subreddit_sort_wrap.dart';

class SubredditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            SubredditHeader(),
            SubredditSortWrap(),
            PlayerButtonVisibility(),
            PostsCount(),
            PostsList(),
          ],
        ),
      ),
    );
  }
}
