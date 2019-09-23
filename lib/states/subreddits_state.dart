import 'package:provider_assist/base_view_model.dart';

class SubredditsState extends BaseViewModel {
  List<String> _subreddits = [
    "metalcore",
    "metal",
    "djent",
    "hardcore",
    "numetal"
  ];
  String _selectedSubreddit = "metalcore";

  List<String> get subreddits => List.from(_subreddits);
  String get selectedSubreddit => _selectedSubreddit;

  void selectSubreddit(String subreddit) {
    _selectedSubreddit = subreddit;
    notifyListeners();
  }
}
