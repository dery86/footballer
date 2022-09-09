
import 'package:flutter/cupertino.dart';

class ApiCredentials{
  static const String apiKey = "5d7f36c54bd973c5c02c957d2bf9bfda";
  static const String host = "v3.football.api-sports.io";
}

class Urls{
  static const String baseUrl = "https://v3.football.api-sports.io";
  static const String fixtures = "/fixtures";
  static const String fixturesLineups = "/fixtures/lineups";
}

class AppColors{
  static const Color primary = Color(0xff448aff);
  static const Color secondary = Color(0xff005ecb);
  static const Color greyLine = Color(0xffaaaaaa);
  static const Color lightGrey = Color(0xffeeeeee);

}

class RouteKeys{
  static const String fixtureId = "fixtureId";
  static const String homeScore = "homeScore";
  static const String awayScore = "awayScore";
  static const String hour = "hour";
  static const String date = "date";
}