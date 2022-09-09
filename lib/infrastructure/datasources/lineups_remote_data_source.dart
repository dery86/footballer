

import 'package:dio/dio.dart';

import '../../common/config.dart';

class LineupsRemoteDataSource {
  final Dio dio;

  LineupsRemoteDataSource(this.dio);

  Future<Response> getFixtureLineups(int fixtureId) async{
    Response response = await dio.get(Urls.fixturesLineups,
        queryParameters: {
          "fixture": fixtureId,
        });
    return response;
  }
}