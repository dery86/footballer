
import 'package:equatable/equatable.dart';
import 'package:footballer/domain/entities/remote/fixtures/fixture_item.dart';

abstract class FixturesState extends Equatable{

}

class FixturesLoadingState extends FixturesState {
  @override
  List<Object?> get props => [];
}

class FixturesLoadedSuccessState extends FixturesState {
  final List<FixtureItem>? data;

  FixturesLoadedSuccessState(this.data);

  @override
  List<Object?> get props => [
    data
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