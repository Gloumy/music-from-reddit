import 'package:audioplayers/audioplayers.dart';
import 'package:youtube_extractor/youtube_extractor.dart';

class PlayAudioService {
  YouTubeExtractor _extractor = YouTubeExtractor();
  AudioPlayer _audioPlayer = AudioPlayer();

  final String youtubeUrl;
  String _youtubeId;

  PlayAudioService({this.youtubeUrl}) {
    _getYoutubeId();
  }

  void _getYoutubeId() {
    RegExp exp = RegExp(
        r"(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})");
    _youtubeId = exp.firstMatch(youtubeUrl).group(1);
  }

  void playAudio() async {
    var streamInfo = await _extractor.getMediaStreamsAsync(_youtubeId);

    await _audioPlayer.play(streamInfo.audio.first.url);
  }
}
