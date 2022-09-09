import 'package:footballer/presentation/lineups/models/i_lineup.dart';
import 'package:footballer/presentation/lineups/models/i_player.dart';
import 'package:footballer/presentation/lineups/models/remote_player.dart';

class RemoteLineup implements ILineup{
  String? homeLogo;
  String? homeName;
  String? awayLogo;
  String? awayName;
  List<RemotePlayer>? homePlayers;
  List<RemotePlayer>? awayPlayers;

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
  List<IPlayer>? getAwayPlayers() {
    return awayPlayers;
  }

  @override
  List<IPlayer>? getHomePlayers() {
    return homePlayers;
  }

}