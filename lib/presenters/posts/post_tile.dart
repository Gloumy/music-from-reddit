import 'package:flutter/material.dart';
import 'package:redditify/models/post.dart';

class PostTile extends StatelessWidget {
  final Post post;

  const PostTile({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Image.network(post.thumbnailUrl),
            flex: 2,
          ),
          SizedBox(
            width: 5.0,
          ),
          Expanded(
            flex: 4,
            child: Text(post.title),
          ),
          Expanded(
            flex: 2,
            child: Icon(Icons.play_circle_outline),
          ),
        ],
      ),
    );
  }
}
