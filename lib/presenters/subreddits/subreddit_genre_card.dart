import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/models/genre.dart';
import 'package:redditify/states/global_state.dart';

class SubredditGenreCard extends StatelessWidget {
  final Genre genre;

  const SubredditGenreCard({Key key, this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<GlobalState>(context).selectGenre(genre);
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(genre.asset), fit: BoxFit.cover)),
        child: Center(
          child: Text(
            genre.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(0.0, 0.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
