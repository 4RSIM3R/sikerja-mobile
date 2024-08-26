import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/common/utils/api_path.dart';
import 'package:next_starter/data/datasources/remote_datasources/announcement_remote/announcement_remote.dart';
import 'package:next_starter/data/models/announcement/announcement_model.dart';

class AnnouncementRemoteImpl extends BaseDioRemoteSource implements AnnouncementRemote {
  AnnouncementRemoteImpl(super.dio, super.session);

  @override
  Future<PaginatedAnnouncement> get(int page) {
    return networkRequest(
      request: (dio) => dio.get(ApiPath.activity, queryParameters: {'page': page}),
      onResponse: (response) => PaginatedAnnouncement.fromJson(response),
    );
  }
}