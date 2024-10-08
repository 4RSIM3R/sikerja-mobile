import 'package:dio/dio.dart';
import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/common/utils/api_path.dart';
import 'package:next_starter/data/datasources/remote_datasources/activity_remote/activity_remote.dart';
import 'package:next_starter/data/models/activity/activity_model.dart';

class ActivityRemoteImpl extends BaseDioRemoteSource implements ActivityRemote {
  ActivityRemoteImpl(super.dio, super.session);

  @override
  Future<PaginatedActivity> all(int page) async {
    return networkRequest(
      request: (dio) => dio.get(ApiPath.activity, queryParameters: {'page': page}),
      onResponse: (reponse) => PaginatedActivity.fromJson(reponse),
      isAuth: true,
    );
  }

  @override
  Future<void> evidence(int id, FormData data) async {
    return networkRequest(
      request: (dio) => dio.post('${ApiPath.activity}/evidence/$id', data: data),
      onResponse: (reponse) {},
      isAuth: true,
    );
  }
}
