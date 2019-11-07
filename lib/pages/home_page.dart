import 'package:flutter/material.dart';
import 'package:redditify/presenters/subreddits/subreddit_genres_grid.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png"),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: SubredditGenresGrid(),
    );
  }
}
