import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/player_state.dart';

class PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerState>(
      builder: (context, state, _) {
        return Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.skip_previous),
              Icon(Icons.play_arrow),
              Icon(Icons.skip_next),
            ],
          ),
        );
      },
    );
  }
}
