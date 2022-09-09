import 'package:footballer/presentation/fixtures/models/i_finished_game.dart';

class RemoteFinishedGame implements IFinishedGame{
  int? id;
  String? leagueName;
  String? homeLogo;
  String? homeName;
  int? homeScore;
  String? guestLogo;
  String? guestName;
  int? guestScore;
  String? hour;
  String? date;
  String? courtName;


  @override
  String? getCourtName() {
    return courtName;
  }

  @override
  String? getDate() {
    return date;
  }

  @override
  String? getGuestLogo() {
    return guestLogo;
  }

  @override
  String? getGuestName() {
    return guestName;
  }

  @override
  int? getGuestScore() {
    return guestScore;
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
  int? getHomeScore() {
    return homeScore;
  }

  @override
  String? getHour() {
    return hour;
  }

  @override
  int? getId() {
    return id;
  }

  @override
  String? getLeagueName() {
    return leagueName;
  }
}