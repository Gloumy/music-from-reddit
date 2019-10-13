import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/global_state.dart';

class SubredditSelectionButton extends StatelessWidget {
  final String subreddit;
  final bool isSelected;

  const SubredditSelectionButton({
    Key key,
    this.subreddit,
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 3),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        child: Text("r/$subreddit"),
        onPressed: () {
          Provider.of<GlobalState>(context).selectSubreddit(subreddit);
        },
        color: isSelected ? Colors.blue : null,
      ),
    );
  }
}
