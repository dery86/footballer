
import 'package:equatable/equatable.dart';
import 'package:footballer/presentation/lineups/models/i_lineup.dart';

abstract class LineupsState extends Equatable{

}

class LineupsLoadingState extends LineupsState {
  @override
  List<Object?> get props => [];
}

class LineupsLoadedSuccessState extends LineupsState {
  final ILineup data;

  LineupsLoadedSuccessState(this.data);

  @override
  List<Object?> get props => [
    data
  ];
}

class LineupsLoadedFailureState extends LineupsState {
  final String message;

  LineupsLoadedFailureState(this.message);

  @override
  List<Object?> get props => [
    message
  ];

}