import 'package:footballer/domain/entities/remote/fixtures/score.dart';
import 'package:footballer/domain/entities/remote/fixtures/teams.dart';

import 'fixture.dart';
import 'goals.dart';
import 'league.dart';

class FixtureItem{
  Fixture? fixture;
  League? league;
  Teams? teams;
  Goals? goals;
  Score? score;

  FixtureItem({this.fixture, this.league, this.teams, this.goals, this.score});

  FixtureItem.fromJson(Map<String, dynamic> json) {
    fixture =
    json['fixture'] != null ? Fixture.fromJson(json['fixture']) : null;
    league =
    json['league'] != null ? League.fromJson(json['league']) : null;
    teams = json['teams'] != null ? Teams.fromJson(json['teams']) : null;
    goals = json['goals'] != null ? Goals.fromJson(json['goals']) : null;
    score = json['score'] != null ? Score.fromJson(json['score']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fixture != null) {
      data['fixture'] = fixture!.toJson();
    }
    if (league != null) {
      data['league'] = league!.toJson();
    }
    if (teams != null) {
      data['teams'] = teams!.toJson();
    }
    if (goals != null) {
      data['goals'] = goals!.toJson();
    }
    if (score != null) {
      data['score'] = score!.toJson();
    }
    return data;
  }
}