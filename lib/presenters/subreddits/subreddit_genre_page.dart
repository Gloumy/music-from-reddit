import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/presenters/subreddits/subreddit_genre_header.dart';
import 'package:redditify/presenters/subreddits/subreddit_selection_button.dart';
import 'package:redditify/presenters/visibility/go_back_button.dart';
import 'package:redditify/states/subreddits_state.dart';

class SubredditGenrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SubredditGenreHeader(),
                GoBackButton(),
              ],
            ),
            Consumer<SubredditsState>(
              builder: (context, state, _) {
                return Expanded(
                  child: ListView(children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 3.0,
                      children: <Widget>[
                        for (String subreddit in state.selectedGenre.subreddits)
                          SubredditSelectionButton(
                            subreddit: subreddit,
                            isSelected: state.selectedSubreddit == subreddit,
                          )
                      ],
                    ),
                  ]),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
