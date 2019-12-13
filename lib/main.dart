import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/pages/global_page.dart';
import 'package:redditify/states/global_state.dart';
import 'package:redditify/states/loading_state.dart';
import 'package:redditify/states/player_state.dart';
import 'package:redditify/states/posts_state.dart';
import 'package:redditify/states/subreddits_state.dart';
import 'package:redditify/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalState _globalState = GlobalState();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalState>.value(
          value: _globalState,
        ),
        ChangeNotifierProvider<SubredditsState>.value(
          value: _globalState.subredditsState,
        ),
        ChangeNotifierProvider<PostsState>.value(
          value: _globalState.postsState,
        ),
        ChangeNotifierProvider<MyPlayerState>.value(
          value: _globalState.playerState,
        ),
        ChangeNotifierProvider<LoadingState>.value(
          value: _globalState.loadingState,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music From Reddit',
        theme: appTheme,
        home: GlobalPage(),
      ),
    );
  }
}
