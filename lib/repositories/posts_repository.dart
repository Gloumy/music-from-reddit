import 'package:dio/dio.dart';
import 'package:redditify/models/post.dart';
import 'package:redditify/utils/dio_client.dart';

class PostsRepository {
  Future<List<Post>> retrievePosts(String subreddit, String sortBy) async {
    Response response = await dio
        .get('http://www.reddit.com/r/$subreddit/$sortBy.json?limit=100');

    List<dynamic> responseData = response.data["data"]["children"];
    List<Post> posts = [];
    RegExp exp = RegExp(
        r"(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})");

    // Directly filter posts matching youtube url
    responseData.forEach((p) {
      if (exp.hasMatch(p["data"]["url"])) posts.add(Post.fromJson(p["data"]));
    });

    return posts;
  }
}
