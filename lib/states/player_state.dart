import 'package:flutter_exoplayer/audioplayer.dart';
import 'package:flutter/foundation.dart';
import 'package:redditify/models/playlist.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/services/play_audio_service.dart';

class MyPlayerState with ChangeNotifier {
  final PlayAudioService _playAudioService = PlayAudioService();
  bool _isPlaying = false;
  Playlist _playlist = Playlist.empty();
  String _playlistName;
  int _currentSongIndex;
  PlayerState _audioPlayerState;
  String _currentSongTitle;
  Duration _currentSongMaxDuration;
  Duration _currentSongPosition;

  PlayAudioService get playAudioService => _playAudioService;
  bool get isPlaying => _isPlaying;
  Playlist get playlist => _playlist;
  String get playlistName => _playlistName;
  int get currentSongIndex => _currentSongIndex;
  PlayerState get audioPlayerState => _audioPlayerState;
  String get currentSongTitle => _currentSongTitle;
  Duration get currentSongMaxDuration => _currentSongMaxDuration;
  Duration get currentSongPosition => _currentSongPosition;

  bool get canPlayPrevious =>
      _playlist.songs.isNotEmpty && _currentSongIndex > 0;
  bool get canPlayNext =>
      _playlist.songs.isNotEmpty && _currentSongIndex < _playlist.songs.length;

  MyPlayerState() {
    _playAudioService.audioPlayer.onPlayerStateChanged
        .listen((PlayerState state) {
      _audioPlayerState = state;
      notifyListeners();
    });
    _playAudioService.audioPlayer.onDurationChanged.listen((Duration duration) {
      _currentSongMaxDuration = duration;
      notifyListeners();
    });
    _playAudioService.audioPlayer.onAudioPositionChanged
        .listen((Duration position) {
      _currentSongPosition = position;
      notifyListeners();
    });
    _playAudioService.audioPlayer.onCurrentAudioIndexChanged
        .listen((int index) {
      _currentSongIndex = index;
      _currentSongTitle = _playlist.songs[index].title;
      notifyListeners();
    });
  }

  Future<void> playSong(String youtubeUrl, String title) async {
    _playlist = [];
    _currentSongTitle = title;
    _isPlaying = true;
    notifyListeners();

    await _playAudioService.playAudio(youtubeUrl);
  }

  Future<void> playSongList(Playlist playlist) async {
    _playlist = playlist;
    _currentSongIndex = 0;
    _currentSongTitle = _playlist.songs[_currentSongIndex].title;
    _playAudioService.audioPlayer
        .playAll(_playlist.songs.map((s) => s.audioStreamUrl).toList());
    _isPlaying = true;
    notifyListeners();
      }

  Future<void> stopAudio() async {
    _playAudioService.audioPlayer.stop();
    _currentSongIndex = 0;
    _playlist = [];
    _currentSongTitle = null;
    _currentSongMaxDuration = null;
    _currentSongPosition = null;
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> playNextSong() async {
    if (canPlayNext) {
      _playAudioService.audioPlayer.next();
    }
  }

  Future<void> playPreviousSong() async {
    if (canPlayPrevious) {
      _playAudioService.audioPlayer.previous();
    }
  }

  Future<void> pauseAudio() async {
    _playAudioService.audioPlayer.pause();
  }

  Future<void> resumeAudio() async {
    _playAudioService.audioPlayer.resume();
  }

  // Future<void> jumpToSong(int index) async {
  //   _currentSongIndex = index;
  //   _currentSongTitle = _playlist[_currentSongIndex].title;
  //   notifyListeners();
  //   _playAudioService.playAudio(_playlist[_currentSongIndex].url);
  // }
}
