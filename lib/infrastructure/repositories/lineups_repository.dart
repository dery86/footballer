
import 'package:dio/dio.dart';
import 'package:footballer/domain/entities/remote/lineups/lineup_item.dart';
import 'package:footballer/infrastructure/datasources/lineups_remote_data_source.dart';
import 'package:footballer/infrastructure/interfaces/lineups_interface.dart';
import 'package:footballer/domain/entities/remote/config/response_type.dart' as res_type;
import '../../domain/entities/remote/config/response_wrapper.dart';

class LineupsRepository implements LineupsInterface{
  LineupsRepository(this.lineupsRemoteDataSource,);

  final LineupsRemoteDataSource lineupsRemoteDataSource;

  @override
  Future<ResponseWrapper<List<LineupItem>>> getFixtureLineups(int? fixtureId)async{
    try {
      Response responses = await lineupsRemoteDataSource.getFixtureLineups(fixtureId, );
      if (responses.statusCode == 200) {
        if(responses.data['response']!=null){
          var res = ResponseWrapper<List<LineupItem>>();
          List<LineupItem> list = [];
          responses.data['response'].forEach((v) {
            list.add(LineupItem.fromJson(v));
          });
          res.responseType = res_type.ResponseType.success;
          res.response = list;
          return res;
        }
      }
      var res = ResponseWrapper<List<LineupItem>>();
      res.responseType = res_type.ResponseType.serverError;
      return res;
    } on DioError catch(e){
      var res = ResponseWrapper<List<LineupItem>>();
      res.responseType = res_type.ResponseType.serverError;
      res.message = e.message;
      return res;
    } catch (e) {
      var res = ResponseWrapper<List<LineupItem>>();
      res.responseType = res_type.ResponseType.clientError;
      return res;
    }
  }
}