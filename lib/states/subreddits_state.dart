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

  List<String> get subreddits => List.from(_subreddits);
  String get selectedSubreddit => _selectedSubreddit;

  void selectSubreddit(String subreddit) {
    _selectedSubreddit = subreddit;
    notifyListeners();
  }
}
