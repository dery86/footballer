
import '../../domain/entities/remote/config/response_wrapper.dart';
import '../../domain/entities/remote/lineups/lineup_item.dart';

abstract class LineupsInterface{
  Future<ResponseWrapper<List<LineupItem>>> getFixtureLineups(int fixtureId);
}