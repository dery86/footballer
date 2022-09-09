
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:footballer/presentation/fixtures/models/i_upcoming_game.dart';

import '../../common/config.dart';

class UpcomingGameItem extends StatelessWidget {
  const UpcomingGameItem(this.game, {Key? key}) : super(key: key);
  final IUpcomingGame? game;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 16, top: 16, end: 16),
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: game?.getHomeLogo()??"",
                width: 40,
                height: 32,
              ),
              const SizedBox(width: 8,),
              Container(
                width: MediaQuery.of(context).size.width*0.2,
                alignment: AlignmentDirectional.center,
                child: Text(
                  game?.getHomeName()??"",
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Text(
                "Away",
                style: TextStyle(
                    fontSize: 12,
                    color: AppColors.greyLine
                ),
              ),
            ],
          ),

          const SizedBox(width: 16,),
          Column(
            children: [
              Text(
                game?.getHour()??"",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red[400]
                ),
              ),
              Text(
                game?.getDate()??"",
                style: const TextStyle(
                  fontSize: 15,
                ),
              )
            ],
          ),
          const SizedBox(width: 16,),
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: game?.getAwayLogo()??"",
                width: 48,
                height: 40,
              ),
              const SizedBox(width: 8,),
              Container(
                width: MediaQuery.of(context).size.width*0.2,
                alignment: AlignmentDirectional.center,
                child: Text(
                  game?.getAwayName()??"",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Text(
                "Away",
                style: TextStyle(
                    fontSize: 12,
                    color: AppColors.greyLine
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
