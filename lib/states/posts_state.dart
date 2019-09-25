import 'package:provider_assist/base_view_model.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/repositories/posts_repository.dart';

class PostsState extends BaseViewModel {
  List<Post> _posts = [];

  // Getters
  List<Post> get posts => List.from(_posts);

  PostsRepository _postsRepository = PostsRepository();

  Future<void> retrievePosts(String subreddit) async {
    _posts = await _postsRepository.retrievePosts();
    notifyListeners();
  }
}
