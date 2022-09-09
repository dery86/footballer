
import 'package:footballer/domain/entities/remote/fixtures/fixture_item.dart';

import '../../domain/entities/remote/config/response_wrapper.dart';

abstract class FixturesInterface{
  Future<ResponseWrapper<List<FixtureItem>>> getFixtures(int season, int leagueId);
}