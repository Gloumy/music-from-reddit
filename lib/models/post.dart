class Post {
  final String title;
  final String url;
  final String thumbnailUrl;

  Post({
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnail"]
      );
}
