import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/models/genre.dart';
import 'package:redditify/presenters/subreddits/subreddit_selection_button.dart';
import 'package:redditify/states/subreddits_state.dart';

class SubredditsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SubredditsState>(
      builder: (context, state, _) {
        return Expanded(
          child: ListView(
            children: <Widget>[
              for (Genre genre in state.subreddits)
                ExpansionTile(
                  title: Center(child: Text(genre.title)),
                  children: <Widget>[
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 3.0,
                      children: <Widget>[
                        for (String subreddit in genre.subreddits)
                          SubredditSelectionButton(
                            subreddit: subreddit,
                            isSelected: state.selectedSubreddit == subreddit,
                          )
                      ],
                    ),
                  ],
                )
            ],
          ),
        );
      },
    );
  }
}
