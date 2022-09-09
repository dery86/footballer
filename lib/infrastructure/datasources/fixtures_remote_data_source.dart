import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../common/config.dart';

class FixturesRemoteDataSource {
  final Dio dio;

  FixturesRemoteDataSource(this.dio);

  Future<Response> getFixtures(int? season, int? leagueId) async {
    Response response = await dio.get(
      Urls.fixtures,
      queryParameters: {
        "season": season,
        "league": leagueId,
      },
      options: buildCacheOptions(const Duration(days: 1)),
    );
    return response;
  }
}
