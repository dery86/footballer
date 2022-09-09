
import 'package:equatable/equatable.dart';

abstract class FixturesEvent extends Equatable{

}

class GetFixturesEvent extends FixturesEvent {
  final int? season;
  final int? leagueId;

  GetFixturesEvent(this.season, this.leagueId);

  @override
  List<Object?> get props => [
    season, leagueId
  ];

}