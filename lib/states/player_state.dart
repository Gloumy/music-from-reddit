import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/services/play_audio_service.dart';

class PlayerState with ChangeNotifier {
  final PlayAudioService _playAudioService = PlayAudioService();
  bool _isPlaying = false;
  List<Post> _playlist = [];
  int _currentSongIndex;
  AudioPlayerState _audioPlayerState;

  PlayAudioService get playAudioService => _playAudioService;
  bool get isPlaying => _isPlaying;
  List<Post> get playlist => List.from(_playlist);
  int get currentSongIndex => _currentSongIndex;
  AudioPlayerState get audioPlayerState => _audioPlayerState;

  PlayerState() {
    _playAudioService.audioPlayer.onPlayerStateChanged
        .listen((AudioPlayerState state) {
      _audioPlayerState = state;
      print(state);
      notifyListeners();
    });
  }

  String get currentSongTitle {
    return _playlist[_currentSongIndex].title;
  }

  Future<void> playSong(String youtubeUrl) async {
    _isPlaying = true;
    notifyListeners();

    await _playAudioService.playAudio(youtubeUrl);
  }

  Future<void> playSongList(List<Post> playlist) async {
    _playlist = playlist;
    _currentSongIndex = 0;
    _playAudioService.playAudio(_playlist.first.url);
    _isPlaying = true;
    notifyListeners();
    _playAudioService.audioPlayer.onPlayerCompletion.listen((event) {
      if (_currentSongIndex < _playlist.length) {
        playNextSong();
      } else {
        stopAudio();
      }
    });
  }

  Future<void> stopAudio() async {
    _playAudioService.audioPlayer.stop();
    _currentSongIndex = 0;
    _playlist = [];
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> playNextSong() async {
    _currentSongIndex++;
    notifyListeners();
    _playAudioService.playAudio(_playlist[_currentSongIndex].url);
  }

  Future<void> playPreviousSong() async {
    _currentSongIndex--;
    notifyListeners();
    _playAudioService.playAudio(_playlist[_currentSongIndex].url);
  }

  Future<void> pauseAudio() async {
    _playAudioService.audioPlayer.pause();
  }

  Future<void> resumeAudio() async {
    _playAudioService.audioPlayer.resume();
  }
}
