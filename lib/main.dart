import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/pages/global_page.dart';
import 'package:redditify/pages/home_page.dart';
import 'package:redditify/states/global_state.dart';
import 'package:redditify/states/player_state.dart';
import 'package:redditify/states/posts_state.dart';
import 'package:redditify/states/subreddits_state.dart';
import 'package:redditify/utils/routes.dart';
import 'package:redditify/utils/theme.dart';

void main() {
  Routes.createRoutes();
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
        ChangeNotifierProvider<PlayerState>.value(
          value: _globalState.playerState,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music From Reddit',
        navigatorKey: Routes.sailor.navigatorKey, // important
        onGenerateRoute: Routes.sailor.generator(),
        theme: appTheme,
        home: HomePage(),
      ),
    );
  }
}
