import 'package:flutter/material.dart';
import 'package:redditify/presenters/subreddits/subreddit_sort_button.dart';

class SubredditSortWrap extends StatelessWidget {
  final List<String> _sortBys = ["new", "hot", "top", "rising"];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 3.0,
      children: <Widget>[
        for (String sortBy in _sortBys)
          SubredditSortButton(
            sortBy: sortBy,
          )
      ],
    );
  }
}
