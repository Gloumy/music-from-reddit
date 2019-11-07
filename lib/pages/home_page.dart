import 'package:flutter/material.dart';
import 'package:redditify/presenters/subreddits/subreddits_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png"),
        centerTitle: true,
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Music From Reddit"),
    //     centerTitle: true,
    //   ),
    //   body: Container(
    //     margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
    //     child: Column(
    //       children: <Widget>[
    //         SubredditsList(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
