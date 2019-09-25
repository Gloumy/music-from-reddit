import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:youtube_extractor/youtube_extractor.dart';

class PlaySinglePostButton extends StatefulWidget {
  final String url;

  const PlaySinglePostButton({Key key, this.url}) : super(key: key);

  @override
  _PlaySinglePostButtonState createState() => _PlaySinglePostButtonState();
}

class _PlaySinglePostButtonState extends State<PlaySinglePostButton> {
  String get urlId => _getYoutubeId(widget.url);
  bool _playing = false;

  String _getYoutubeId(String url) {
    RegExp exp = RegExp(
        r"(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})");
    return exp.firstMatch(url).group(1);
  }

  void _playAudio() async {
    var streamInfo = await YouTubeExtractor().getMediaStreamsAsync(urlId);
    setState(() {
      _playing = true;
    });
    await AudioPlayer().play(streamInfo.audio.first.url);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        child: Icon(_playing ? Icons.pause_circle_outline : Icons.play_circle_outline),
        onTap: () {
          _playAudio();
        },
      ),
    );
  }
}
