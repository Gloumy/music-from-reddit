class Post {
  final String title;

  Post({this.title});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json["title"],
      );
}
