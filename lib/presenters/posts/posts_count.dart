import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/posts_state.dart';

class PostsCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsState>(
      builder: (context, state, _) {
        return Text(
          "${state.postsLength} titres",
          style: TextStyle(
            fontSize: 14,
            shadows: [
              Shadow(
                offset: Offset(0.0, 0.0),
                blurRadius: 5.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
            color: Colors.white,
          ),
        );
      },
    );
  }
}
