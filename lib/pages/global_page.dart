import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/pages/home_page.dart';
import 'package:redditify/pages/subreddit_page.dart';
import 'package:redditify/presenters/subreddits/subreddit_genre_page.dart';
import 'package:redditify/states/global_state.dart';
import 'package:redditify/widgets/collapsed_player.dart';
import 'package:redditify/widgets/loading_indicator.dart';
import 'package:redditify/widgets/playlist_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GlobalPage extends StatelessWidget {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_panelController.isPanelOpen()) {
          _panelController.close();
        } else {
          Provider.of<GlobalState>(context).goBack();
        }

        return false;
      },
      child: Scaffold(
        body: Provider<PanelController>.value(
          value: _panelController,
          child: SlidingUpPanel(
            minHeight: 75,
            body: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Consumer<GlobalState>(
                builder: (context, state, _) {
                  return Stack(
                    children: <Widget>[
                      IndexedStack(
                        index: state.visibleIndex,
                        children: <Widget>[
                          HomePage(),
                          SubredditGenrePage(),
                          SubredditPage(),
                        ],
                      ),
                      LoadingIndicator(),
                    ],
                  );
                },
              ),
              padding: EdgeInsets.only(bottom: 75),
            ),
            panel: PlaylistPanel(),
            collapsed: CollapsedPlayer(),
            controller: _panelController,
            backdropOpacity: 0.5,
            backdropEnabled: true,
          ),
        ),
      ),
    );
  }
}
