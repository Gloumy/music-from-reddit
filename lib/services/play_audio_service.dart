import 'package:audioplayers/audioplayers.dart';
import 'package:youtube_extractor/youtube_extractor.dart';

class PlayAudioService {
  AudioPlayer _audioPlayer = AudioPlayer();

  String _youtubeId;

  AudioPlayer get audioPlayer => _audioPlayer;

  void _getYoutubeId(String youtubeUrl) {
    RegExp exp = RegExp(
        r"(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})");
    _youtubeId = exp.firstMatch(youtubeUrl).group(1);
  }

  Future<void> playAudio(String youtubeUrl) async {
    _getYoutubeId(youtubeUrl);
    // Use a new extractor for each request to avoid client close
    var streamInfo = await YouTubeExtractor().getMediaStreamsAsync(_youtubeId);

    await _audioPlayer.play(streamInfo.audio.first.url);
  }
}
