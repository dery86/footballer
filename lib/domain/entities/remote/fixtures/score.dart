import 'goals.dart';

class Score {
  Goals? halftime;
  Goals? fulltime;


  Score({this.halftime, this.fulltime, });

  Score.fromJson(Map<String, dynamic> json) {
    halftime =
    json['halftime'] != null ? Goals.fromJson(json['halftime']) : null;
    fulltime =
    json['fulltime'] != null ? Goals.fromJson(json['fulltime']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (halftime != null) {
      data['halftime'] = halftime!.toJson();
    }
    if (fulltime != null) {
      data['fulltime'] = fulltime!.toJson();
    }
    return data;
  }
}