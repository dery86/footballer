import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:footballer/common/config.dart';
import 'package:footballer/presentation/fixtures/models/i_finished_game.dart';

class FinishedGameItem extends StatelessWidget {
  const FinishedGameItem(this.game, {Key? key}) : super(key: key);
  final IFinishedGame? game;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 16, top: 16, end: 16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16,),
          Text(game?.getCourtName()??""),
          const SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 24),
              Column(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        game?.getHomeLogo()??"",
                    width: 48,
                    height: 40,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.26,
                    alignment: AlignmentDirectional.center,
                    child: Text(
                        game?.getHomeName()??"",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.greyLine
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Text(
                "${game?.getHomeScore()??""} - ${game?.getGuestScore()??""}",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        game?.getGuestLogo()??"",
                    width: 48,
                    height: 40,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.26,
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      game?.getGuestName()??"",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16
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
              const SizedBox(width: 24),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 1,
            margin: const EdgeInsetsDirectional.only(top: 16, bottom: 4),
            color: AppColors.greyLine,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                game?.getHour()??"",
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              Text(
                " - "+(game?.getDate()??""),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 16,),

        ],
      ),
    );
  }
}
