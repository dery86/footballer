import 'package:flutter/material.dart';
import 'package:footballer/common/config.dart';
import 'package:footballer/presentation/fixtures/finished_game_item.dart';
import 'package:footballer/presentation/lineups/lineups_ui.dart';

class FinishedGamesTab extends StatefulWidget {
  const FinishedGamesTab({Key? key}) : super(key: key);

  @override
  State<FinishedGamesTab> createState() => _FinishedGamesTabState();
}

class _FinishedGamesTabState extends State<FinishedGamesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightGrey,
      child: ListView.builder(
        itemCount: 20,
        padding: EdgeInsetsDirectional.only(bottom: 16),
        itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(LineupsUi.routeName,);
          },
            child: FinishedGameItem(),
        );
      },),
    );
  }
}
