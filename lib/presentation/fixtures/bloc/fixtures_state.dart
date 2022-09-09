
import 'package:equatable/equatable.dart';
import 'package:footballer/domain/entities/remote/fixtures/fixture_item.dart';
import 'package:footballer/presentation/fixtures/models/i_finished_game.dart';
import 'package:footballer/presentation/fixtures/models/i_upcoming_game.dart';

abstract class FixturesState extends Equatable{

}

class FixturesLoadingState extends FixturesState {
  @override
  List<Object?> get props => [];
}

class FixturesLoadedSuccessState extends FixturesState {
  final List<IFinishedGame>? finishedGames;
  final List<IUpcomingGame>? upcomingGames;

  FixturesLoadedSuccessState(this.finishedGames, this.upcomingGames);

  @override
  List<Object?> get props => [
    finishedGames, upcomingGames
  ];
}

class FixturesLoadedFailureState extends FixturesState {
  final String message;

  FixturesLoadedFailureState(this.message);

  @override
  List<Object?> get props => [
    message
  ];

}