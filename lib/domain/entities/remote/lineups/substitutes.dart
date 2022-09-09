
import 'package:footballer/domain/entities/remote/lineups/player.dart';

class Substitutes {
  Player? player;

  Substitutes({this.player});

  Substitutes.fromJson(Map<String, dynamic> json) {
    player =
    json['player'] != null ? Player.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (player != null) {
      data['player'] = player!.toJson();
    }
    return data;
  }
}