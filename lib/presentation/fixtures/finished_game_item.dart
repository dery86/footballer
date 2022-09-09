import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:footballer/common/config.dart';

class FinishedGameItem extends StatelessWidget {
  const FinishedGameItem({Key? key}) : super(key: key);

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
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16,),
          const Text("Name Of the league"),
          const SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 24),
              Column(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://media.api-sports.io/football/teams/8193.png',
                    width: 48,
                    height: 40,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      "Finland U21",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                    ),
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.greyLine
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              const Text(
                "1 - 0",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://media.api-sports.io/football/teams/8186.png',
                    width: 48,
                    height: 40,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Croatia U21",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                    ),
                  ),
                  Text(
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
            margin: EdgeInsetsDirectional.only(top: 16, bottom: 4),
            color: AppColors.greyLine,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "11:00 PM",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Text(
                "- Wed 7 July",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 16,),

        ],
      ),
    );
  }
}
