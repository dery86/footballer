import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footballer/domain/entities/remote/config/response_wrapper.dart';
import 'package:footballer/domain/entities/remote/lineups/lineup_item.dart';
import 'package:footballer/infrastructure/repositories/lineups_repository.dart';
import 'package:footballer/presentation/lineups/bloc/bloc.dart';
import 'package:footballer/presentation/lineups/models/i_lineup.dart';
import 'package:footballer/presentation/lineups/models/remote_lineup.dart';
import 'package:footballer/presentation/lineups/models/remote_player.dart';

import '../../../domain/entities/remote/config/response_type.dart';

class LineupsBloc extends Bloc<LineupsEvent, LineupsState> {
  final LineupsRepository lineupsRepository;

  LineupsBloc(this.lineupsRepository) : super(LineupsLoadingState()) {
    on((event, emit) async {
      if (event is GetLineupsEvent) {
        ResponseWrapper<List<LineupItem>> response =
            await lineupsRepository.getFixtureLineups(event.fixtureId);

        switch (response.responseType) {
          case ResponseType.success:
            emit(LineupsLoadedSuccessState(getData(response.response)));
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

  ILineup getData(List<LineupItem>? response) {
    RemoteLineup data = RemoteLineup();
    if (response?.isNotEmpty == true) {
      data.homeName = response![0].team?.name;
      data.homeLogo = response[0].team?.logo;
      List<RemotePlayer> homePlayers=[];
      for(int i = 0; i < (response[0].startXI?.length??0); i++){
        homePlayers.add(RemotePlayer()
        ..name = response[0].startXI![i].player?.name
        ..id = response[0].startXI![i].player?.id
        ..number = response[0].startXI![i].player?.number);
      }
      data.homePlayers = homePlayers;

      data.awayName = response[1].team?.name;
      data.awayLogo = response[1].team?.logo;
      List<RemotePlayer> awayPlayers=[];
      for(int i = 0; i < (response[1].startXI?.length??0); i++){
        awayPlayers.add(RemotePlayer()
          ..name = response[1].startXI![i].player?.name
          ..id = response[1].startXI![i].player?.id
          ..number = response[1].startXI![i].player?.number);
      }
      data.awayPlayers = awayPlayers;
    }
    return data;
  }
}
