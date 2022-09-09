
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/config.dart';

class UpcomingGameItem extends StatelessWidget {
  const UpcomingGameItem({Key? key}) : super(key: key);

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
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://media.api-sports.io/football/teams/8220.png',
                width: 40,
                height: 32,
              ),
              SizedBox(width: 8,),
              Text(
                "San Marino U21",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
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

          SizedBox(width: 16,),
          Column(
            children: [
              Text(
                "06:30",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red[400]
                ),
              ),
              Text(
                "30 OCT",
                style: TextStyle(
                  fontSize: 15,
                ),
              )
            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://media.api-sports.io/football/teams/8204.png',
                width: 48,
                height: 40,
              ),
              SizedBox(width: 8,),
              Text(
                "Latvia U21",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
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

        ],
      ),
    );
  }
}
