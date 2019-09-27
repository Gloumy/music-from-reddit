import 'package:flutter/material.dart';
import 'package:redditify/presenters/posts/posts_list.dart';
import 'package:sailor/sailor.dart';

class SubredditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String subreddit = Sailor.param<String>(context, 'subreddit');
    return Scaffold(
      appBar: AppBar(
        title: Text("r/$subreddit"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Column(
          children: <Widget>[
            // PostsList(),
          ],
        ),
      ),
    );
  }
}
