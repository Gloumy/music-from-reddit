import 'package:flutter/widgets.dart';
import 'package:redditify/utils/subreddits_list.dart';

class SubredditsState with ChangeNotifier {
  List<Map<String,dynamic>> _subreddits = subredditsList;
  String _selectedSubreddit;
  String _sortBy = "new";

  List<Map<String,dynamic>> get subreddits => List.from(_subreddits);
  String get selectedSubreddit => _selectedSubreddit;
  String get sortBy => _sortBy;

  void selectSubreddit(String subreddit, String sortBy) {
    _selectedSubreddit = subreddit;
    _sortBy = sortBy;
    notifyListeners();
  }
}
