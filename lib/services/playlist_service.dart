import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redditify/models/playlist.dart';
import 'package:redditify/models/playlist_item.dart';
import 'package:redditify/models/post.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' hide Playlist;

class PlaylistService {
  final List<Post> posts;
  final String title;

  PlaylistService({
    @required this.posts,
    @required this.title,
  });

  StreamController<int> streamController = StreamController<int>();

  Future<Playlist> createPlaylist() async {
    List<PlaylistItem> _items = [];
    RegExp exp = RegExp(
        r"(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})");
    for (var i = 0; i < posts.length; i++) {
      streamController.add(i + 1);
      String youtubeId = exp.firstMatch(posts[i].url).group(1);
      try {
        var yt = YoutubeExplode();
        var video = await yt.videos.get(youtubeId);
        var manifest = await yt.videos.streamsClient.getManifest(youtubeId);
        var streamInfo = manifest.audioOnly.withHighestBitrate();
        if (streamInfo.url != null)
          _items.add(PlaylistItem(
            title: video.title,
            audioStreamUrl: streamInfo.url.toString(),
            thumbnailUrl: posts[i].thumbnailUrl,
          ));
      } catch (e) {
        print("Couldn't add song ${posts[i].title}");
      }
    }
    Playlist playlist = Playlist(title: title, songs: _items);

    return playlist;
  }
}
