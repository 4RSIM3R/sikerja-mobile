import 'package:dio/dio.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/common/typedefs/typedefs.dart';
import 'package:next_starter/data/datasources/remote_datasources/activity_remote/activity_remote.dart';
import 'package:next_starter/data/datasources/session/session_source.dart';
import 'package:next_starter/data/models/activity/activity_model.dart';
import 'package:next_starter/injection.dart';

class ActivityRepository extends BaseRepository {
  ActivityRepository(super.networkInfo);

  final ActivityRemote remote = locator();
  final SessionSource session = locator();

  EitherResponse<PaginateActivityModel> all(int page) async {
    return handleNetworkCall(
      call: remote.all(page),
      onSuccess: (r) => r,
    );
  }

  EitherResponse<void> submit(int id, FormData data) async {
    return handleNetworkCall(
      call: remote.submit(id, data),
      onSuccess: (r) => r,
    );
  }
}
