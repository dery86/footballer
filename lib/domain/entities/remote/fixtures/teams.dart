import 'package:footballer/domain/entities/remote/common/team.dart';

class Teams {
  Team? home;
  Team? away;

  Teams({this.home, this.away});

  Teams.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? Team.fromJson(json['home']) : null;
    away = json['away'] != null ? Team.fromJson(json['away']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (home != null) {
      data['home'] = home!.toJson();
    }
    if (away != null) {
      data['away'] = away!.toJson();
    }
    return data;
  }
}