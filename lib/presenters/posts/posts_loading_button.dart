import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/posts_state.dart';

class PostsLoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: RaisedButton(
        child: Text("r/metalcore"),
        onPressed: () =>
            Provider.of<PostsState>(context).retrievePosts("r/metalcore"),
      ),
    );
  }
}
