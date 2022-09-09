
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footballer/domain/entities/remote/config/response_wrapper.dart';
import 'package:footballer/domain/entities/remote/lineups/lineup_item.dart';
import 'package:footballer/infrastructure/repositories/lineups_repository.dart';
import 'package:footballer/presentation/lineups/bloc/bloc.dart';

import '../../../domain/entities/remote/config/response_type.dart';

class LineupsBloc extends Bloc<LineupsEvent, LineupsState> {
  final LineupsRepository lineupsRepository;

  LineupsBloc(this.lineupsRepository) : super(LineupsLoadingState()) {
    on((event, emit) async {
      if (event is GetLineupsEvent) {
        ResponseWrapper<List<LineupItem>> response =
        await lineupsRepository.getFixtureLineups(event.fixtureId);

        switch(response.responseType){

          case ResponseType.success:
            emit(LineupsLoadedSuccessState(response.response));
            break;
          case ResponseType.networkError:
            emit(LineupsLoadedFailureState("Network Error"));
            break;
          case ResponseType.validationError:

            break;
          case ResponseType.clientError:
            emit(LineupsLoadedFailureState("Client Error"));
            break;
          case ResponseType.serverError:
            emit(LineupsLoadedFailureState("Server Error"));
            break;
          default:

        }
      }
    });
  }
}
