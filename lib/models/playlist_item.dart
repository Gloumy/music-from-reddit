import 'package:flutter/material.dart';

enum PlaylistItemStatus { PENDING, PLAYING, PLAYED, ERROR }

class PlaylistItem {
  final String title;
  final String audioStreamUrl;
  PlaylistItemStatus status;

  PlaylistItem({
    @required this.title,
    @required this.audioStreamUrl,
    this.status = PlaylistItemStatus.PENDING,
  });
}
