import 'package:flutter/material.dart';
import 'package:footballer/common/config.dart';
import 'package:footballer/presentation/fixtures/finished_game_item.dart';
import 'package:footballer/presentation/fixtures/models/i_finished_game.dart';
import 'package:footballer/presentation/lineups/lineups_ui.dart';

class FinishedGamesTab extends StatefulWidget {
  const FinishedGamesTab(this.games, {Key? key}) : super(key: key);

  final List<IFinishedGame>? games;
  @override
  State<FinishedGamesTab> createState() => _FinishedGamesTabState();
}

class _FinishedGamesTabState extends State<FinishedGamesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightGrey,
      child: ListView.builder(
        itemCount: widget.games?.length??0,
        padding: const EdgeInsetsDirectional.only(bottom: 16),
        itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(LineupsUi.routeName,);
          },
            child: FinishedGameItem(widget.games![index]),
        );
      },),
    );
  }
}
