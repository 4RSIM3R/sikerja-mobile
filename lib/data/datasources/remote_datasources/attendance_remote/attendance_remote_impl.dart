import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/data/datasources/remote_datasources/attendance_remote/attendance_remote.dart';

class AttendanceRemoteImpl extends BaseDioRemoteSource implements AttendanceRemote {
  AttendanceRemoteImpl(super.dio, super.session);
  
  @override
  Future<void> history() async {
    // TODO: implement history
    throw UnimplementedError();
  }
  
  @override
  Future<void> submit() async {
    // TODO: implement submit
    throw UnimplementedError();
  }
  
  @override
  Future<void> today() async {
    // TODO: implement today
    throw UnimplementedError();
  }
}
