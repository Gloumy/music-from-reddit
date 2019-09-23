import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/presenters/posts/posts_list.dart';
import 'package:redditify/presenters/posts/posts_loading_button.dart';
import 'package:redditify/states/posts_state.dart';
import 'package:youtube_extractor/youtube_extractor.dart';

class HomePage extends StatelessWidget {
  YouTubeExtractor extractor = YouTubeExtractor();
  var streamInfo;

  final List<String> _subreddits = const ["metalcore", "metal", "deathcore"];

  void _getAudioStream() async {
    streamInfo = await extractor.getMediaStreamsAsync('rqMrZlLJXRA');
    print("Audio url : ${streamInfo.audio.first.url}");
  }

  void _playFromUrl() async {
    int result = await AudioPlayer().play(streamInfo.audio.first.url);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostsState>(
      builder: (context) => PostsState(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Redditify"),
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            RaisedButton(
              child: Text("Test extractor"),
              onPressed: _getAudioStream,
            ),
            RaisedButton(
              child: Text("play"),
              onPressed: _playFromUrl,
            )
            // for (String subreddit in _subreddits)
            //   PostsLoadingButton(
            //     subreddit: subreddit,
            //   ),
            // PostsList(),
          ],
        ),
      ),
    );
  }
}
