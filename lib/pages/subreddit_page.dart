import 'package:flutter/material.dart';
import 'package:redditify/presenters/player/player_button_visibility.dart';
import 'package:redditify/presenters/posts/posts_list.dart';
import 'package:redditify/presenters/subreddits/subreddit_header.dart';
import 'package:redditify/presenters/visibility/go_back_button.dart';

class SubredditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                SubredditHeader(),
                GoBackButton(),
                Positioned(
                  child: PlayerButtonVisibility(),
                  bottom: -10,
                  right: 20,
                ),
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            PostsList(),
          ],
        ),
      ),
    );
  }
}
