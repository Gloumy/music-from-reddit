import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redditify/models/playlist.dart';
import 'package:redditify/models/playlist_item.dart';
import 'package:redditify/models/post.dart';
import 'package:youtube_extractor/youtube_extractor.dart';

class PlaylistService {
  final List<Post> posts;
  final String title;

  PlaylistService({
    @required this.posts,
    @required this.title,
  });

  StreamController<int> streamController = StreamController<int>();

  Future<Playlist> createPlaylist() async {
    print("Create playlist");
    List<PlaylistItem> _items = [];
    RegExp exp = RegExp(
        r"(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})");
    for (var i = 0; i < posts.length; i++) {
      streamController.add(i + 1);
      String youtubeId = exp.firstMatch(posts[i].url).group(1);
      try {
        var streamInfo =
            await YouTubeExtractor().getMediaStreamsAsync(youtubeId);
        if (streamInfo.audio.isNotEmpty && streamInfo.audio.first.url != null)
          _items.add(PlaylistItem(
            title: posts[i].title,
            audioStreamUrl: streamInfo.audio.first.url,
          ));
        print("Added ${posts[i].title}");
      } catch (e) {
        print("Couldn't add song ${posts[i].title}");
      }
    }
    print("Added ${_items.length} songs");
    Playlist playlist = Playlist(title: title, songs: _items);

    return playlist;
  }
}
