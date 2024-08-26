import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/common/typedefs/typedefs.dart';
import 'package:next_starter/data/datasources/remote_datasources/announcement_remote/announcement_remote.dart';
import 'package:next_starter/data/models/announcement/announcement_model.dart';
import 'package:next_starter/injection.dart';

class AnnouncementRepository extends BaseRepository {
  AnnouncementRepository(super.networkInfo);

  final remote = locator<AnnouncementRemote>();

  Future<EitherResponse<PaginatedAnnouncement>> get(int page) async {
    return handleNetworkCall(
      call: remote.get(page),
      onSuccess: (r) => r,
    );
  }
}
