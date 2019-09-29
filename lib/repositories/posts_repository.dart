import 'package:dio/dio.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/utils/dio_client.dart';

class PostsRepository {
  Future<List<Post>> retrievePosts(String subreddit, String sortBy) async {
    Response response = await dio
        .get('http://www.reddit.com/r/$subreddit/$sortBy.json?limit=100');

    List<dynamic> responseData = response.data["data"]["children"];
    List<Post> posts = [];
    responseData.forEach((p) => posts.add(Post.fromJson(p["data"])));

    return posts;
  }
}
