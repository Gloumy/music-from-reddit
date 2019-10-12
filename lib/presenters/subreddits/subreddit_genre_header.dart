import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/subreddits_state.dart';

class SubredditGenreHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SubredditsState>(
      builder: (context, state, _) {
        return Container(
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(state.selectedGenre?.asset),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              state.selectedGenre?.title,
              style: TextStyle(
                fontSize: 24,
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
        );
      },
    );
  }
}
