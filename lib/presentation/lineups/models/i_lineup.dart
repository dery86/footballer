import 'package:footballer/presentation/lineups/models/i_player.dart';

abstract class ILineup{
  String? getHomeName();
  String? getHomeLogo();
  String? getAwayName();
  String? getAwayLogo();
  List<IPlayer>? getHomePlayers();
  List<IPlayer>? getAwayPlayers();
}