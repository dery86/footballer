
import 'package:dio/dio.dart';

import '../../common/config.dart';

class FixturesRemoteDataSource {
  final Dio dio;

  FixturesRemoteDataSource(this.dio);
  Future<Response> getFixtures(int? season, int? leagueId) async{
    Response response = await dio.get(Urls.fixtures,
    queryParameters: {
      "season": season,
      "league": leagueId
    });
    return response;
  }
}