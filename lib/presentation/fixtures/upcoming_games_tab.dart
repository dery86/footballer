import 'package:flutter/material.dart';
import 'package:footballer/presentation/fixtures/upcoming_game_item.dart';

import '../../common/config.dart';

class UpcomingGamesTab extends StatefulWidget {
  const UpcomingGamesTab({Key? key}) : super(key: key);

  @override
  State<UpcomingGamesTab> createState() => _UpcomingGamesTabState();
}

class _UpcomingGamesTabState extends State<UpcomingGamesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightGrey,
      child: ListView.builder(
        itemCount: 20,
        padding: const EdgeInsetsDirectional.only(bottom: 16),
        itemBuilder: (context, index) {
          return const UpcomingGameItem();
        },),
    );
  }
}
