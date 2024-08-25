import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/data/datasources/remote_datasources/announcement_remote/announcement_remote.dart';

class AnnouncementRemoteImpl extends BaseDioRemoteSource implements AnnouncementRemote {
  AnnouncementRemoteImpl(super.dio, super.session);
}
