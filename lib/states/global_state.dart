import 'package:flutter/foundation.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/states/player_state.dart';
import 'package:redditify/states/posts_state.dart';
import 'package:redditify/states/subreddits_state.dart';

class GlobalState with ChangeNotifier {
  PostsState _postsState;
  SubredditsState _subredditsState;
  PlayerState _playerState;

  PostsState get postsState => _postsState;
  SubredditsState get subredditsState => _subredditsState;
  PlayerState get playerState => _playerState;

  GlobalState() {
    _initializeStates();
  }

  void _initializeStates() {
    _postsState = PostsState();
    _subredditsState = SubredditsState();
    _playerState = PlayerState();
  }

  void selectSubreddit(String subreddit, {String sortBy = "new"}) {
    _subredditsState.selectSubreddit(subreddit, sortBy);
    _postsState.retrievePosts(subreddit, sortBy);
    notifyListeners();
  }

  void playSong(String youtubeUrl, String title) async {
    await _playerState.playSong(youtubeUrl, title);
  }

  void playSongList() async {
    List<Post> playlist = List.from(postsState.posts);
    _playerState.playSongList(playlist);
  }

  void stopAudio() async {
    _playerState.stopAudio();
  }
}
