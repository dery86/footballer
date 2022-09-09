import 'package:footballer/domain/entities/remote/lineups/player.dart';

class StartXI {
  Player? player;

  StartXI({this.player});

  StartXI.fromJson(Map<String, dynamic> json) {
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