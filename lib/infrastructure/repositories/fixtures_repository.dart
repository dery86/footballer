
import 'package:dio/dio.dart';
import 'package:footballer/infrastructure/datasources/fixtures_remote_data_source.dart';
import 'package:footballer/infrastructure/interfaces/fixtures_interface.dart';
import 'package:footballer/domain/entities/remote/config/response_type.dart' as res_type;
import '../../domain/entities/remote/config/response_wrapper.dart';
import '../../domain/entities/remote/fixtures/fixture_item.dart';

class FixturesRepository implements FixturesInterface{
  FixturesRepository(this.fixturesRemoteDataSource,);

  final FixturesRemoteDataSource fixturesRemoteDataSource;

  @override
  Future<ResponseWrapper<List<FixtureItem>>> getFixtures(int? season, int? leagueId)async{
    try {
      Response responses = await fixturesRemoteDataSource.getFixtures(
          season, leagueId);
      if (responses.statusCode == 200) {
        if(responses.data['response']!=null){
          var res = ResponseWrapper<List<FixtureItem>>();
          List<FixtureItem> list = [];
          responses.data['response'].forEach((v) {
            list.add(FixtureItem.fromJson(v));
          });
          res.responseType = res_type.ResponseType.success;
          res.response = list;
          return res;
        }
      }
      var res = ResponseWrapper<List<FixtureItem>>();
      res.responseType = res_type.ResponseType.serverError;
      return res;
    } on DioError catch(e){
      var res = ResponseWrapper<List<FixtureItem>>();
      res.responseType = res_type.ResponseType.serverError;
      res.message = e.message;
      return res;
    } catch (e) {
      var res = ResponseWrapper<List<FixtureItem>>();
      res.responseType = res_type.ResponseType.clientError;
      return res;
    }
  }
}