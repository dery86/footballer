import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:footballer/presentation/lineups/player_widget.dart';

class Court extends StatelessWidget {
  const Court({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/images/court.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
        //home team
        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.03,
          start: 16,
          child: CachedNetworkImage(
            imageUrl:
            'https://media.api-sports.io/football/teams/8193.png',
            width: 48,
            height: 40,
          ),
        ),

        //home goal keeper
        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.02,
          child: const PlayerWidget("Edmon", Colors.indigo, "90"),
        ),

        // home Row 1
        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.12,
          child: const PlayerWidget("Edmon", Colors.indigo, "90"),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.34,
          child: const PlayerWidget("Edmon", Colors.indigo, "90"),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.56,
          child: const PlayerWidget("Edmon", Colors.indigo, "90"),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.78,
          child: const PlayerWidget("Edmon", Colors.indigo, "90"),
        ),

        //home Row 2
        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.12,
          child: const PlayerWidget("Edmon", Colors.indigo, "90"),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.34,
          child: const PlayerWidget("Edmon", Colors.indigo, "90"),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.56,
          child: const PlayerWidget("Edmon", Colors.indigo, "90"),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.78,
          child: const PlayerWidget("Edmon", Colors.indigo, "90"),
        ),

        //home row 3
        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.41,
          start: MediaQuery.of(context).size.width * 0.34,
          child: const PlayerWidget("Edmon", Colors.indigo, "90"),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.41,
          start: MediaQuery.of(context).size.width * 0.56,
          child: const PlayerWidget("Edmon", Colors.indigo, "90"),
        ),

        //away team
        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.03,
          end: 16,
          child: CachedNetworkImage(
            imageUrl:
            'https://media.api-sports.io/football/teams/8220.png',
            width: 48,
            height: 40,
          ),
        ),

        //away goal keeper
        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.02,
          child: const PlayerWidget("Edmon", Colors.red, "90"),
        ),

        // away Row 1
        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.12,
          child: const PlayerWidget("Edmon", Colors.red, "90"),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.34,
          child: const PlayerWidget("Edmon", Colors.red, "90"),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.56,
          child: const PlayerWidget("Edmon", Colors.red, "90"),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.78,
          child: const PlayerWidget("Edmon", Colors.red, "90"),
        ),

        //away Row 2
        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.12,
          child: const PlayerWidget("Edmon", Colors.red, "90"),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.34,
          child: const PlayerWidget("Edmon", Colors.red, "90"),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.56,
          child: const PlayerWidget("Edmon", Colors.red, "90"),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.78,
          child: const PlayerWidget("Edmon", Colors.red, "90"),
        ),

        //away row 3
        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.39,
          start: MediaQuery.of(context).size.width * 0.34,
          child: const PlayerWidget("Edmon", Colors.red, "90"),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.39,
          start: MediaQuery.of(context).size.width * 0.56,
          child: const PlayerWidget("Edmon", Colors.red, "90"),
        ),
      ],
    );
  }
}
