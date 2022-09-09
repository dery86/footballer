
import 'package:equatable/equatable.dart';

abstract class LineupsEvent extends Equatable{

}

class GetLineupsEvent extends LineupsEvent {
  final int? fixtureId;

  GetLineupsEvent(this.fixtureId, );

  @override
  List<Object?> get props => [
    fixtureId,
  ];

}