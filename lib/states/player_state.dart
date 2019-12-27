import 'package:flutter_exoplayer/audio_notification.dart';
import 'package:flutter_exoplayer/audioplayer.dart';
import 'package:flutter/foundation.dart';
import 'package:redditify/models/playlist.dart';
import 'package:redditify/models/playlist_item.dart';
import 'package:redditify/services/play_audio_service.dart';

class MyPlayerState with ChangeNotifier {
  final PlayAudioService _playAudioService = PlayAudioService();
  bool _isPlaying = false;
  Playlist _playlist = Playlist.empty();
  int _currentSongIndex;
  PlayerState _audioPlayerState;
  String _currentSongTitle;
  Duration _currentSongMaxDuration;
  Duration _currentSongPosition;

  PlayAudioService get playAudioService => _playAudioService;
  bool get isPlaying => _isPlaying;
  Playlist get playlist => _playlist;
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
      if (index > 0)
        _playlist.songs.sublist(0, index).forEach((s) {
          if (s.status != PlaylistItemStatus.ERROR)
            s.status = PlaylistItemStatus.PLAYED;
        });
      _playlist.songs[index].status = PlaylistItemStatus.PLAYING;
      if (index <= _playlist.songs.length)
        _playlist.songs
            .sublist(index + 1)
            .forEach((s) => s.status = PlaylistItemStatus.PENDING);
      notifyListeners();
    });
    _playAudioService.audioPlayer.onPlayerError.listen((String error) {
      _playlist.songs[_currentSongIndex].status = PlaylistItemStatus.ERROR;
      print("ERROR : $error");
      playNextSong();
    });
    _playAudioService.audioPlayer.onNotificationActionCallback
        .listen((NotificationActionName notificationAction) {
      switch (notificationAction) {
        case NotificationActionName.PAUSE:
          pauseAudio();
          break;
        default:
      }
    });
  }

  Future<void> playSong(PlaylistItem item) async {
    _currentSongTitle = item.title;
    _isPlaying = true;
    notifyListeners();

    _playAudioService.playAudio(item);
  }

  Future<void> playSongList(Playlist playlist) async {
    _playlist = playlist;
    _currentSongIndex = 0;
    _currentSongTitle = _playlist.songs[_currentSongIndex].title;
    _playAudioService.playSongsList(playlist);
    _isPlaying = true;
    notifyListeners();
  }

  Future<void> stopAudio() async {
    _playAudioService.audioPlayer.release();
    _currentSongIndex = 0;
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

  Future<void> jumpToSong(int index) async {
    _playAudioService.audioPlayer.seekIndex(index);
  }
}
