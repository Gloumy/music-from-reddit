import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/global_state.dart';
import 'package:redditify/states/subreddits_state.dart';
import 'package:redditify/utils/colors.dart';

class SubredditSortButton extends StatelessWidget {
  final String sortBy;

  const SubredditSortButton({Key key, this.sortBy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SubredditsState>(
      builder: (context, state, _) {
        return GestureDetector(
          child: Chip(
            label: Text(
              sortBy,
              style: TextStyle(
                  color:
                      state.sortBy == sortBy ? lightGreyColor : redditOrange),
            ),
            backgroundColor:
                state.sortBy == sortBy ? redditOrange : lightGreyColor,
          ),
          onTap: () => Provider.of<GlobalState>(context).selectSubreddit(
            state.selectedSubreddit,
            sortBy: sortBy,
          ),
        );
      },
    );
  }
}
