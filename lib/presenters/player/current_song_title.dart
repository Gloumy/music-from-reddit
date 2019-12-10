import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditify/states/player_state.dart';
import 'package:redditify/utils/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CurrentSongTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyPlayerState>(
      builder: (context, state, _) {
        return Expanded(
          flex: 8,
          child: GestureDetector(
            onTap: () {
              PanelController panelController =
                  Provider.of<PanelController>(context, listen: false);
              if (panelController.isPanelOpen()) {
                panelController.close();
              } else {
                panelController.open();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                state.currentSongTitle ?? "No current song playing.",
                textAlign: TextAlign.center,
                style: TextStyle(color: lightGreyColor),
              ),
            ),
          ),
        );
      },
    );
  }
}
