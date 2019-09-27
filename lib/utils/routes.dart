import 'package:redditify/pages/subreddit_page.dart';
import 'package:sailor/sailor.dart';

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoute(
      SailorRoute(
        name: "/subreddit",
        builder: (context, args, params) {
          return SubredditPage();
        },
        params: [
          SailorParam(name: "subreddit", isRequired: true),
        ],
      ),
    );
  }
}
