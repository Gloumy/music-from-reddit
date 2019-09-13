import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/posts_state.dart';

class PostsLoadingButton extends StatelessWidget {
  final String subreddit;

  const PostsLoadingButton({Key key, this.subreddit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("r/$subreddit"),
        onPressed: () =>
            Provider.of<PostsState>(context).retrievePosts("r/$subreddit"),
      ),
    );
  }
}
