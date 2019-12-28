import 'package:flutter/foundation.dart';
import 'package:redditify/models/genre.dart';
import 'package:redditify/models/playlist.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/models/visible_item.dart';
import 'package:redditify/services/playlist_service.dart';
import 'package:redditify/states/loading_state.dart';
import 'package:redditify/states/player_state.dart';
import 'package:redditify/states/posts_state.dart';
import 'package:redditify/states/subreddits_state.dart';

class GlobalState with ChangeNotifier {
  PostsState _postsState;
  SubredditsState _subredditsState;
  MyPlayerState _playerState;
  LoadingState _loadingState;
  int _visibleIndex = 0;

  PostsState get postsState => _postsState;
  SubredditsState get subredditsState => _subredditsState;
  MyPlayerState get playerState => _playerState;
  LoadingState get loadingState => _loadingState;
  int get visibleIndex => _visibleIndex;

  GlobalState() {
    _initializeStates();
  }

  void _initializeStates() {
    _postsState = PostsState();
    _subredditsState = SubredditsState();
    _playerState = MyPlayerState();
    _loadingState = LoadingState();
  }

  void selectSubreddit(String subreddit, {String sortBy = "new"}) async {
    _subredditsState.selectSubreddit(subreddit, sortBy);
    _loadingState.setBusy(true, mainText: "Fetching threads ..");
    await _postsState.retrievePosts(subreddit, sortBy);
    _loadingState.setBusy(false);
    setVisibleIndex(VisibleItem.SubredditPage);
    notifyListeners();
  }

  void playSong(Post post) async {
    _loadingState.setBusy(true, mainText: "Creating item ..");
    PlaylistService _playlistService = PlaylistService(
        title: _subredditsState.selectedSubreddit, posts: [post]);
    Playlist playlist = await _playlistService.createPlaylist();
    _loadingState.setBusy(false);
    await _playerState.playSong(playlist.songs.first);
  }

  void playSongList() async {
    _loadingState.setBusy(true, mainText: "Creating playlist ..");
    PlaylistService _playlistService = PlaylistService(
        title: _subredditsState.selectedSubreddit,
        posts: List.from(postsState.posts));
    Stream<int> stream = _playlistService.streamController.stream;
    stream.listen((int value) {
      _loadingState.setBusy(true,
          mainText: "Creating playlist ..",
          subText: "${value.toString()}/${postsState.postsLength}");
    });
    Playlist playlist = await _playlistService.createPlaylist();
    _loadingState.setBusy(false);
    playerState.playSongList(playlist);
  }

  void stopAudio() async {
    _playerState.stopAudio();
  }

  void setVisibleIndex(VisibleItem item) {
    _visibleIndex = item.index;
    notifyListeners();
  }

  void goBack() {
    if (_visibleIndex > 0) {
      _visibleIndex--;
      notifyListeners();
    }
  }

  void selectGenre(Genre genre) {
    _subredditsState.selectGenre(genre);
    setVisibleIndex(VisibleItem.SubredditGenrePage);
    notifyListeners();
  }
}
