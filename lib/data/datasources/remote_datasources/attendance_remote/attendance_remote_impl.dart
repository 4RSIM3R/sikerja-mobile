import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/data/datasources/remote_datasources/attendance_remote/attendance_remote.dart';

class AttendanceRemoteImpl extends BaseDioRemoteSource implements AttendanceRemote {
  AttendanceRemoteImpl(super.dio, super.session);
}
