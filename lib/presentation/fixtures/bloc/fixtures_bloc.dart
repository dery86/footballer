import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footballer/domain/entities/remote/config/response_wrapper.dart';
import 'package:footballer/domain/entities/remote/fixtures/fixture_item.dart';
import 'package:footballer/infrastructure/repositories/fixtures_repository.dart';
import 'package:footballer/presentation/fixtures/bloc/bloc.dart';
import 'package:footballer/presentation/fixtures/models/i_finished_game.dart';
import 'package:footballer/presentation/fixtures/models/i_upcoming_game.dart';
import 'package:footballer/presentation/fixtures/models/remote_finished_fixture.dart';
import 'package:footballer/presentation/fixtures/models/remote_upcoming_game.dart';
import 'package:intl/intl.dart';

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
            List<IFinishedGame> finishedGames = getFinishedGames(response.response);
            List<IUpcomingGame> upcomingGames = getUpcomingGames(response.response);
            emit(FixturesLoadedSuccessState(finishedGames, upcomingGames));
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

  List<IFinishedGame> getFinishedGames(List<FixtureItem>? allGames) {
    List<IFinishedGame> list = [];
    List<FixtureItem>? filtered = allGames?.where((element) =>
        isSmallerThanCurrentTime(element.fixture?.date)).toList();
    DateFormat global = DateFormat("yyyy-MM-dd HH:mm:ss", );
    DateFormat dateFormat = DateFormat("EEE dd MMMM", );
    DateFormat timeFormat = DateFormat.jm();
    for(int i = 0; i < (filtered?.length??0); i++){
      String? s = filtered![i].fixture?.date?.replaceAll("T", " ");
      String date = "";
      String time = "";
      if(s?.isNotEmpty == true){
        DateTime d = global.parse(s!, true);
        d = d.toLocal();
        date = dateFormat.format(d);
        time = timeFormat.format(d);
      }
      list.add(RemoteFinishedGame()
      ..date = " - $date"
      ..hour = time
      ..id = filtered[i].fixture?.id
      ..leagueName = filtered[i].league?.name
      ..homeLogo = filtered[i].teams?.home?.logo
      ..homeName = filtered[i].teams?.home?.name
      ..homeScore = filtered[i].goals?.home
      ..guestLogo = filtered[i].teams?.away?.logo
      ..guestName = filtered[i].teams?.away?.name
      ..guestScore = filtered[i].goals?.away
      ..courtName = filtered[i].fixture?.venue?.name);
    }
    return list;
  }

  bool isSmallerThanCurrentTime(String? date) {
    if(date?.isNotEmpty == true){
      date = date?.replaceAll("T", " ");
      DateTime d = DateFormat("yyyy-MM-dd HH:mm:ss",).parse(date!, true);
      d = d.toLocal();
      DateTime now = DateTime.now();
      return d.isBefore(now);
    }
    return false;
  }

  List<IUpcomingGame> getUpcomingGames(List<FixtureItem>? allGames) {
    List<IUpcomingGame> list = [];
    List<FixtureItem>? filtered = allGames?.where((element) =>
        !isSmallerThanCurrentTime(element.fixture?.date)).toList();
    DateFormat global = DateFormat("yyyy-MM-dd HH:mm:ss", );
    DateFormat dateFormat = DateFormat("dd MMM", );
    DateFormat timeFormat = DateFormat.Hm();
    for(int i = 0; i < (filtered?.length??0); i++){
      String? s = filtered![i].fixture?.date?.replaceAll("T", " ");
      String date = "";
      String time = "";
      if(s?.isNotEmpty == true){
        DateTime d = global.parse(s!, true);
        d = d.toLocal();
        date = dateFormat.format(d);
        time = timeFormat.format(d);
      }
      list.add(RemoteUpcomingGame()
        ..date = "$date"
        ..hour = time
        ..id = filtered[i].fixture?.id
        ..homeLogo = filtered[i].teams?.home?.logo
        ..homeName = filtered[i].teams?.home?.name
        ..awayLogo = filtered[i].teams?.away?.logo
        ..awayName = filtered[i].teams?.away?.name);
    }
    return list;
  }
}
