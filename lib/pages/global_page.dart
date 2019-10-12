import 'package:flutter/material.dart';
import 'package:redditify/presenters/player/player_bottom_sheet.dart';
import 'package:redditify/presenters/subreddits/subreddit_genres_grid.dart';

class GlobalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SubredditGenresGrid(),
      ),
      bottomSheet: PlayerBottomSheet(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.playlist_play), title: Text("Playlist")),
        ],
      ),
    );
  }
}
