import 'package:flutter/widgets.dart';
import 'package:redditify/models/genre.dart';
import 'package:redditify/utils/subreddits_list.dart';

class SubredditsState with ChangeNotifier {
  List<Genre> _subreddits = subredditsList;
  String _selectedSubreddit;
  Genre _selectedGenre = Genre(
      asset: "assets/images/rock-music.jpg",
      title: "Rock Music",
      subreddits: []);
  String _sortBy = "new";

  List<Genre> get subreddits => List.from(_subreddits);
  String get selectedSubreddit => _selectedSubreddit;
  String get sortBy => _sortBy;
  Genre get selectedGenre => _selectedGenre;

  void selectSubreddit(String subreddit, String sortBy) {
    _selectedSubreddit = subreddit;
    _sortBy = sortBy;
    notifyListeners();
  }

  void selectGenre(Genre genre) {
    _selectedGenre = genre;
    notifyListeners();
  }
}
