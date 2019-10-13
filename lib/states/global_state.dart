import 'package:flutter/foundation.dart';
import 'package:redditify/models/genre.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/states/player_state.dart';
import 'package:redditify/states/posts_state.dart';
import 'package:redditify/states/subreddits_state.dart';

class GlobalState with ChangeNotifier {
  PostsState _postsState;
  SubredditsState _subredditsState;
  PlayerState _playerState;
  int _visibleIndex = 0;

  PostsState get postsState => _postsState;
  SubredditsState get subredditsState => _subredditsState;
  PlayerState get playerState => _playerState;
  int get visibleIndex => _visibleIndex;

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
    _visibleIndex = 2;
    notifyListeners();
  }

  void playSong(String youtubeUrl, String title) async {
    await _playerState.playSong(youtubeUrl, title);
  }

  void playSongList() async {
    List<Post> playlist = List.from(postsState.posts);
    _playerState.setPlaylistName(_subredditsState.selectedSubreddit);
    _playerState.playSongList(playlist);
  }

  void stopAudio() async {
    _playerState.stopAudio();
  }

  void setVisibleIndex(int index) {
    _visibleIndex = index;
    notifyListeners();
  }

  void selectGenre(Genre genre) {
    _subredditsState.selectGenre(genre);
    setVisibleIndex(1);
    notifyListeners();
  }
}
