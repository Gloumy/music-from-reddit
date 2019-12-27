import 'package:flutter_exoplayer/audio_notification.dart';
import 'package:redditify/models/playlist_item.dart';

class Playlist {
  String title;
  List<PlaylistItem> songs;

  List<String> get streamUrls => songs.map((s) => s.audioStreamUrl).toList();
  List<AudioNotification> get notifications {
    List<AudioNotification> _notifications = [];
    songs.forEach(
      (s) => _notifications.add(
        AudioNotification(
          title: s.title,
          smallIconFileName: "ic_launcher",
          isLocal: false,
          largeIconUrl: s.thumbnailUrl,
        ),
      ),
    );

    return _notifications;
  }

  Playlist({
    this.title,
    this.songs,
  });

  factory Playlist.empty() => Playlist(songs: [], title: "");
}
