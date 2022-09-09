import 'package:footballer/domain/entities/remote/lineups/start_x_i.dart';
import 'package:footballer/domain/entities/remote/lineups/substitutes.dart';

import '../common/team.dart';
import 'coach.dart';

class LineupItem {
  Team? team;
  Coach? coach;
  List<StartXI>? startXI;
  List<Substitutes>? substitutes;

  LineupItem(
      {this.team, this.coach, this.startXI, this.substitutes});

  LineupItem.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    coach = json['coach'] != null ? Coach.fromJson(json['coach']) : null;
    if (json['startXI'] != null) {
      startXI = <StartXI>[];
      json['startXI'].forEach((v) {
        startXI!.add(StartXI.fromJson(v));
      });
    }
    if (json['substitutes'] != null) {
      substitutes = <Substitutes>[];
      json['substitutes'].forEach((v) {
        substitutes!.add(Substitutes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (team != null) {
      data['team'] = team!.toJson();
    }
    if (coach != null) {
      data['coach'] = coach!.toJson();
    }
    if (startXI != null) {
      data['startXI'] = startXI!.map((v) => v.toJson()).toList();
    }
    if (substitutes != null) {
      data['substitutes'] = substitutes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}