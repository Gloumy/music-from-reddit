import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/presenters/posts/posts_list.dart';
import 'package:redditify/presenters/posts/posts_loading_button.dart';
import 'package:redditify/states/posts_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostsState>(
      builder: (context) => PostsState(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Redditify"),
        ),
        body: ListView(
          children: <Widget>[
            PostsLoadingButton(),
            PostsList(),
          ],
        ),
      ),
    );
  }
}
