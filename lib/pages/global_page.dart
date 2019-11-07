import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/pages/home_page.dart';
import 'package:redditify/pages/subreddit_page.dart';
import 'package:redditify/presenters/subreddits/subreddit_genre_page.dart';
import 'package:redditify/states/global_state.dart';
import 'package:redditify/utils/colors.dart';
import 'package:redditify/widgets/collapsed_player.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GlobalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 75,
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Consumer<GlobalState>(
            builder: (context, state, _) {
              return IndexedStack(
                index: state.visibleIndex,
                children: <Widget>[
                  HomePage(),
                  SubredditGenrePage(),
                  SubredditPage(),
                ],
              );
            },
          ),
          padding: EdgeInsets.only(bottom: 75),
        ),
        panel: Container(
          color: darkGreyColor,
        ),
        collapsed: CollapsedPlayer(),
      ),
    );
  }
}
