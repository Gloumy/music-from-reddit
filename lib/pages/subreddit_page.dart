import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/presenters/player/player_button_visibility.dart';
import 'package:redditify/presenters/posts/posts_count.dart';
import 'package:redditify/presenters/posts/posts_list.dart';
import 'package:redditify/presenters/subreddits/subreddit_sort_wrap.dart';
import 'package:redditify/states/global_state.dart';
import 'package:redditify/states/subreddits_state.dart';
import 'package:sailor/sailor.dart';

class SubredditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String subreddit = Sailor.param<String>(context, 'subreddit');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SubredditsState>.value(
          value: Provider.of<GlobalState>(context).subredditsState,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("r/$subreddit"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Column(
            children: <Widget>[
              SubredditSortWrap(),
              PlayerButtonVisibility(),
              PostsCount(),
              PostsList(),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),
        bottomSheet: BottomSheet(
          enableDrag: false,
          onClosing: () {},
          builder: (context) {
            return Container(
              height: 50.0,
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              padding: EdgeInsets.symmetric(horizontal: 7.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Text("Our Last Night - Ivory Tower"),
                  ),
                  VerticalDivider(
                    thickness: 3.0,
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.skip_previous),
                        Icon(Icons.play_arrow),
                        Icon(Icons.skip_next),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
