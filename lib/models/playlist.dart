import 'package:redditify/models/playlist_item.dart';

class Playlist {
  String title;
  List<PlaylistItem> songs;

  Playlist({
    this.title,
    this.songs,
  });

  factory Playlist.empty() => Playlist(songs: [], title: "");
}
