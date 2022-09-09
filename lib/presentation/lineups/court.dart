import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:footballer/presentation/lineups/models/i_player.dart';
import 'package:footballer/presentation/lineups/player_widget.dart';

class Court extends StatelessWidget {
  const Court(this.homePlayers, this.awayPlayers,
      this.homeLogo, this.awayLogo,{
    Key? key,
  }) : super(key: key);
  final List<IPlayer>? homePlayers;
  final List<IPlayer>? awayPlayers;
  final String? homeLogo;
  final String? awayLogo;
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
            homeLogo??"",
            width: 48,
            height: 40,
          ),
        ),

        //home goal keeper
        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.02,
          child: PlayerWidget(homePlayers?.elementAt(0).getName()??"",
              Colors.indigo, homePlayers?.elementAt(0).getNumber()?.toString()??""),
        ),

        // home Row 1
        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.12,
          child: PlayerWidget(homePlayers?.elementAt(1).getName()??"",
              Colors.indigo, homePlayers?.elementAt(1).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.34,
          child: PlayerWidget(homePlayers?.elementAt(2).getName()??"",
              Colors.indigo, homePlayers?.elementAt(2).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.56,
          child: PlayerWidget(homePlayers?.elementAt(3).getName()??"",
              Colors.indigo, homePlayers?.elementAt(3).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.78,
          child: PlayerWidget(homePlayers?.elementAt(4).getName()??"",
              Colors.indigo, homePlayers?.elementAt(4).getNumber()?.toString()??""),
        ),

        //home Row 2
        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.12,
          child: PlayerWidget(homePlayers?.elementAt(5).getName()??"",
              Colors.indigo, homePlayers?.elementAt(5).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.34,
          child: PlayerWidget(homePlayers?.elementAt(6).getName()??"",
              Colors.indigo, homePlayers?.elementAt(6).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.56,
          child: PlayerWidget(homePlayers?.elementAt(7).getName()??"",
              Colors.indigo, homePlayers?.elementAt(7).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.78,
          child: PlayerWidget(homePlayers?.elementAt(8).getName()??"",
              Colors.indigo, homePlayers?.elementAt(8).getNumber()?.toString()??""),
        ),

        //home row 3
        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.41,
          start: MediaQuery.of(context).size.width * 0.34,
          child: PlayerWidget(homePlayers?.elementAt(9).getName()??"",
              Colors.indigo, homePlayers?.elementAt(9).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          top: MediaQuery.of(context).size.height * 0.41,
          start: MediaQuery.of(context).size.width * 0.56,
          child: PlayerWidget(homePlayers?.elementAt(10).getName()??"",
              Colors.indigo, homePlayers?.elementAt(10).getNumber()?.toString()??""),
        ),

        //away team
        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.03,
          end: 16,
          child: CachedNetworkImage(
            imageUrl:
            awayLogo??"",
            width: 48,
            height: 40,
          ),
        ),

        //away goal keeper
        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.02,
          child: PlayerWidget(awayPlayers?.elementAt(0).getName()??"",
              Colors.red, awayPlayers?.elementAt(0).getNumber()?.toString()??""),
        ),

        // away Row 1
        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.12,
          child: PlayerWidget(awayPlayers?.elementAt(1).getName()??"",
              Colors.red, awayPlayers?.elementAt(1).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.34,
          child: PlayerWidget(awayPlayers?.elementAt(2).getName()??"",
              Colors.red, awayPlayers?.elementAt(2).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.56,
          child: PlayerWidget(awayPlayers?.elementAt(3).getName()??"",
              Colors.red, awayPlayers?.elementAt(3).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.15,
          start: MediaQuery.of(context).size.width * 0.78,
          child: PlayerWidget(awayPlayers?.elementAt(4).getName()??"",
              Colors.red, awayPlayers?.elementAt(4).getNumber()?.toString()??""),
        ),

        //away Row 2
        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.12,
          child: PlayerWidget(awayPlayers?.elementAt(5).getName()??"",
              Colors.red, awayPlayers?.elementAt(5).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.34,
          child: PlayerWidget(awayPlayers?.elementAt(6).getName()??"",
              Colors.red, awayPlayers?.elementAt(6).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.56,
          child: PlayerWidget(awayPlayers?.elementAt(7).getName()??"",
              Colors.red, awayPlayers?.elementAt(7).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.28,
          start: MediaQuery.of(context).size.width * 0.78,
          child: PlayerWidget(awayPlayers?.elementAt(8).getName()??"",
              Colors.red, awayPlayers?.elementAt(8).getNumber()?.toString()??""),
        ),

        //away row 3
        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.39,
          start: MediaQuery.of(context).size.width * 0.34,
          child: PlayerWidget(awayPlayers?.elementAt(9).getName()??"",
              Colors.red, awayPlayers?.elementAt(9).getNumber()?.toString()??""),
        ),

        PositionedDirectional(
          bottom: MediaQuery.of(context).size.height * 0.39,
          start: MediaQuery.of(context).size.width * 0.56,
          child: PlayerWidget(awayPlayers?.elementAt(10).getName()??"",
              Colors.red, awayPlayers?.elementAt(10).getNumber()?.toString()??""),
        ),
      ],
    );
  }
}
