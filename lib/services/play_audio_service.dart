import 'package:flutter_exoplayer/audio_notification.dart';
import 'package:flutter_exoplayer/audioplayer.dart';
import 'package:redditify/models/playlist.dart';
import 'package:redditify/models/playlist_item.dart';

class PlayAudioService {
  AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  Future<void> playAudio(PlaylistItem item) async {
    _audioPlayer.release();
    await _audioPlayer.play(
      item.audioStreamUrl,
      playerMode: PlayerMode.FOREGROUND,
      respectAudioFocus: true,
      audioNotification: AudioNotification(
        smallIconFileName: "ic_launcher",
        title: item.title,
        largeIconUrl:
            "https://raw.githubusercontent.com/Gloumy/music-from-reddit/master/assets/images/logo.png",
        isLocal: false,
      ),
    );
  }

  Future<void> playSongsList(Playlist playlist) async {
    _audioPlayer.release();
    _audioPlayer.playAll(
      playlist.streamUrls,
      // playerMode: PlayerMode.FOREGROUND,
      // audioNotifications: <AudioNotification>[
      //   AudioNotification(
      //     title: "hello",
      //     smallIconFileName: "ic_launcher",
      //     isLocal: false,
      //   ),
      // ],
    );
  }
}
