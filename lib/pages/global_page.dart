import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/presenters/player/player_bottom_sheet.dart';
import 'package:redditify/states/subreddits_state.dart';

class GlobalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Consumer<SubredditsState>(
          builder: (context, state, _) {
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              children: <Widget>[
                for (Map<String, dynamic> genre in state.subreddits)
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(genre["asset"]),
                              fit: BoxFit.cover)),
                      child: Center(
                        child: Text(
                          genre["title"],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(0.0, 0.0),
                                blurRadius: 5.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            );
          },
        ),
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
