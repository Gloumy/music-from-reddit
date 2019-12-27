import 'package:flutter/material.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/presenters/posts/play_single_post_button.dart';
import 'package:redditify/utils/colors.dart';

class PostTile extends StatelessWidget {
  final Post post;

  const PostTile({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      color: darkGreyColor,
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
            child: Text(
              post.title,
              style: TextStyle(color: lightGreyColor),
            ),
          ),
          PlaySinglePostButton(
            post: post,
          ),
        ],
      ),
    );
  }
}
