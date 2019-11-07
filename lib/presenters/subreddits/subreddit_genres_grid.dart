import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/models/genre.dart';
import 'package:redditify/presenters/subreddits/subreddit_genre_card.dart';
import 'package:redditify/states/subreddits_state.dart';

class SubredditGenresGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SubredditsState>(
      builder: (context, state, _) {
        return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          padding: EdgeInsets.all(5.0),
          children: <Widget>[
            for (Genre genre in state.subreddits)
              Card(
                child: SubredditGenreCard(
                  genre: genre,
                ),
              ),
          ],
        );
      },
    );
  }
}
