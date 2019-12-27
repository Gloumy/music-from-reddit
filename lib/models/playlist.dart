import 'package:redditify/models/playlist_item.dart';

class Playlist {
  String title;
  List<PlaylistItem> songs;

  List<String> get streamUrls => songs.map((s) => s.audioStreamUrl).toList();

  Playlist({
    this.title,
    this.songs,
  });

  factory Playlist.empty() => Playlist(songs: [], title: "");
}
