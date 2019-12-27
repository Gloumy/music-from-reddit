import 'package:flutter_exoplayer/audio_notification.dart';
import 'package:flutter_exoplayer/audioplayer.dart';
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
    _audioPlayer.release();
    await _audioPlayer.play(
      streamInfo.audio.first.url,
      playerMode: PlayerMode.FOREGROUND,
      respectAudioFocus: true,
      audioNotification: AudioNotification(
        smallIconFileName: "ic_launcher",
        title: "Coucou",
        largeIconUrl:
            "https://raw.githubusercontent.com/Gloumy/music-from-reddit/master/assets/images/logo.png",
        isLocal: false,
      ),
    );
  }

  Future<void> playSongsList(List<String> songsUrl) async {
    _audioPlayer.release();
    _audioPlayer.playAll(songsUrl,
        playerMode: PlayerMode.FOREGROUND,
        audioNotifications: <AudioNotification>[
          AudioNotification(
            title: "hello",
            smallIconFileName: "ic_launcher",
            isLocal: false,
          ),
        ]);
  }
}
