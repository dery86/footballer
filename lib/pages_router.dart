
import 'package:flutter/material.dart';
import 'package:footballer/common/config.dart';
import 'package:footballer/presentation/fixtures/fixtures_ui.dart';
import 'package:footballer/presentation/lineups/lineups_ui.dart';

class PagesRouter{

  static Route? getRoutes(RouteSettings settings){
    return MaterialPageRoute(
      builder: (context) {
        switch (settings.name){
          case FixturesUi.routeName:
            return const FixturesUi();
          case LineupsUi.routeName:
            Map map = {};
            if( settings.arguments is Map?){
              map = settings.arguments as Map;
            }
            return LineupsUi(
              map[RouteKeys.fixtureId],
              map[RouteKeys.homeScore],
              map[RouteKeys.awayScore],
              map[RouteKeys.hour],
              map[RouteKeys.date],
            );
          default:
            return const Scaffold(
              body: SafeArea(
                child: Center(
                  child: Text(
                    'Route Error',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}