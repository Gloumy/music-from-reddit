import 'package:flutter/widgets.dart';

class SubredditsState with ChangeNotifier {
  List<String> _subreddits = [
    "metalcore",
    "metal",
    "djent",
    "hardcore",
    "numetal"
  ];
  String _selectedSubreddit;
  String _sortBy = "new";

  List<String> get subreddits => List.from(_subreddits);
  String get selectedSubreddit => _selectedSubreddit;
  String get sortBy => _sortBy;

  void selectSubreddit(String subreddit, String sortBy) {
    _selectedSubreddit = subreddit;
    _sortBy = sortBy;
    notifyListeners();
  }
}
