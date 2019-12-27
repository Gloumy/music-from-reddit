import 'package:flutter/material.dart';

enum PlaylistItemStatus { PENDING, PLAYING, PLAYED, ERROR }

class PlaylistItem {
  final String title;
  final String audioStreamUrl;
  PlaylistItemStatus status;
  final String thumbnailUrl;

  PlaylistItem({
    @required this.title,
    @required this.audioStreamUrl,
    @required this.thumbnailUrl,
    this.status = PlaylistItemStatus.PENDING,
  });
}
