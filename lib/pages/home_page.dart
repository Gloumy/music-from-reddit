import 'package:flutter/material.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/repositories/posts_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> _posts = [];
  PostsRepository _postsRepository = PostsRepository();

  @override
  void initState() {
    super.initState();
    _postsRepository.retrievePosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redditify"),
      ),
      body: Container(),
    );
  }
}
