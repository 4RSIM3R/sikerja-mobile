import 'package:next_starter/data/models/announcement/announcement_model.dart';

abstract class AnnouncementRemote {
  Future<PaginatedAnnouncement> get(int page);
}
