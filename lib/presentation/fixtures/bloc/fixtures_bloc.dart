import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footballer/domain/entities/remote/config/response_wrapper.dart';
import 'package:footballer/domain/entities/remote/fixtures/fixture_item.dart';
import 'package:footballer/infrastructure/repositories/fixtures_repository.dart';
import 'package:footballer/presentation/fixtures/bloc/bloc.dart';

import '../../../domain/entities/remote/config/response_type.dart';

class FixturesBloc extends Bloc<FixturesEvent, FixturesState> {
  final FixturesRepository fixturesRepository;

  FixturesBloc(this.fixturesRepository) : super(FixturesLoadingState()) {
    on((event, emit) async {
      if (event is GetFixturesEvent) {
        ResponseWrapper<List<FixtureItem>> response =
            await fixturesRepository.getFixtures(event.season, event.leagueId);

        switch(response.responseType){

          case ResponseType.success:
            emit(FixturesLoadedSuccessState(response.response));
            break;
          case ResponseType.networkError:
            emit(FixturesLoadedFailureState("Network Error"));
            break;
          case ResponseType.validationError:

            break;
          case ResponseType.clientError:
            emit(FixturesLoadedFailureState("Client Error"));
            break;
          case ResponseType.serverError:
            emit(FixturesLoadedFailureState("Server Error"));
            break;
          default:

        }
      }
    });
  }
}
