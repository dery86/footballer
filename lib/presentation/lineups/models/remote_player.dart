import 'package:footballer/presentation/lineups/models/i_player.dart';

class RemotePlayer implements IPlayer{
  int? id;
  String? name;
  int? number;

  @override
  int? getId() {
    return id;
  }

  @override
  String? getName() {
    return name;
  }

  @override
  int? getNumber() {
    return number;
  }

}