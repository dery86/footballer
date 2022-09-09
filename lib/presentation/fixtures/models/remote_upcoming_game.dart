import 'package:footballer/presentation/fixtures/models/i_upcoming_game.dart';

class RemoteUpcomingGame implements IUpcomingGame{
  int? id;
  String? homeLogo;
  String? homeName;
  String? awayLogo;
  String? awayName;
  String? hour;
  String? date;

  @override
  String? getDate() {
    return date;
  }

  @override
  String? getAwayLogo() {
    return awayLogo;
  }

  @override
  String? getAwayName() {
    return awayName;
  }

  @override
  String? getHomeLogo() {
    return homeLogo;
  }

  @override
  String? getHomeName() {
    return homeName;
  }

  @override
  String? getHour() {
    return hour;
  }

  @override
  int? getId() {
    return id;
  }

}