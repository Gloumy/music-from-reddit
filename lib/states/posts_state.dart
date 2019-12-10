import 'package:flutter/material.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/repositories/posts_repository.dart';

class PostsState with ChangeNotifier {
  List<Post> _posts = [];

  // Getters
  List<Post> get posts => List.from(_posts);
  int get postsLength => _posts.length;

  PostsRepository _postsRepository = PostsRepository();

  Future<void> retrievePosts(String subreddit, String sortBy) async {
    notifyListeners();

    _posts = await _postsRepository.retrievePosts(subreddit, sortBy);

    notifyListeners();
  }
}
