import 'package:provider_assist/base_view_model.dart';

class SubredditsState extends BaseViewModel {
  List<String> _subreddits = [
    "metalcore",
    "metal",
    "djent",
    "hardcore",
    "numetal"
  ];

  List<String> get subreddits => List.from(_subreddits);
}
