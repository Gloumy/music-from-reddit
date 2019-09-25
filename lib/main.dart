import 'package:flutter/material.dart';
import 'package:provider_assist/base_view.dart';
import 'package:redditify/pages/home_page.dart';
import 'package:redditify/states/global_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redditify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BaseView<GlobalState>(
        model: GlobalState(),
        builder: (context, state, layout) {
          return HomePage();
        },
      ),
    );
  }
}
