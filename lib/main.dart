import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/pages/home_page.dart';
import 'package:redditify/states/global_state.dart';
import 'package:redditify/states/posts_state.dart';
import 'package:redditify/states/subreddits_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalState _globalState = GlobalState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redditify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<PostsState>.value(
            value: _globalState.postsState,
          ),
          ChangeNotifierProvider<SubredditsState>.value(
            value: _globalState.subredditsState,
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
