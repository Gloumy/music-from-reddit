import 'package:flutter/foundation.dart';
import 'package:redditify/services/play_audio_service.dart';

class PlayerState with ChangeNotifier {
  final PlayAudioService _playAudioService = PlayAudioService();
  bool _isPlaying = false;

  PlayAudioService get playAudioService => _playAudioService;
  bool get isPlaying => _isPlaying;

  Future<void> playSong(String youtubeUrl) async {
    _isPlaying = true;
    notifyListeners();

    await _playAudioService.playAudio(youtubeUrl);
  }
}
