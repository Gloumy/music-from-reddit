import 'package:provider_assist/provider_assist.dart';
import 'package:redditify/states/posts_state.dart';
import 'package:redditify/states/subreddits_state.dart';

class GlobalState extends BaseViewModel {
  PostsState _postsState;
  SubredditsState _subredditsState;

  PostsState get postsState => _postsState;
  SubredditsState get subredditsState => _subredditsState;

  GlobalState() {
    _initializeStates();
  }

  void _initializeStates() {
    _postsState = PostsState();
    _subredditsState = SubredditsState();
  }

  void selectSubreddit(String subreddit) {
    _subredditsState.selectSubreddit(subreddit);

    notifyListeners();
  }
}
