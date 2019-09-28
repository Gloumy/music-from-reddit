import 'package:flutter/material.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/repositories/posts_repository.dart';

class PostsState with ChangeNotifier {
  List<Post> _posts = [];

  // Getters
  List<Post> get posts => List.from(_posts);
  int get postsLength => _posts.length;

  PostsRepository _postsRepository = PostsRepository();

  Future<void> retrievePosts(String subreddit) async {
    notifyListeners();

    _posts = await _postsRepository.retrievePosts(subreddit);
    filterYoutubePosts();

    notifyListeners();
  }

  void filterYoutubePosts() {
    RegExp exp =
        RegExp(r"^(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+");

    _posts.removeWhere((p) => !exp.hasMatch(p.url));
  }
}
