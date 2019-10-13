import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/models/visible_item.dart';
import 'package:redditify/pages/subreddit_page.dart';
import 'package:redditify/presenters/player/player_bottom_sheet.dart';
import 'package:redditify/presenters/subreddits/subreddit_genre_page.dart';
import 'package:redditify/presenters/subreddits/subreddit_genres_grid.dart';
import 'package:redditify/states/global_state.dart';

class GlobalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Consumer<GlobalState>(
          builder: (context, state, _) {
            return IndexedStack(
              index: state.visibleIndex,
              children: <Widget>[
                SubredditGenresGrid(),
                SubredditGenrePage(),
                SubredditPage(),
              ],
            );
          },
        ),
      ),
      bottomSheet: PlayerBottomSheet(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (int index) {
          switch (index) {
            case 1:
              Provider.of<GlobalState>(context, listen: false)
                  .setVisibleIndex(VisibleItem.SubredditGenresList);
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.playlist_play), title: Text("Playlist")),
        ],
      ),
    );
  }
}
