import 'package:dio/dio.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/common/typedefs/typedefs.dart';
import 'package:next_starter/data/datasources/remote_datasources/attendance_remote/attendance_remote.dart';
import 'package:next_starter/data/models/attendance/attendance_model.dart';
import 'package:next_starter/injection.dart';

class AttendanceRepository extends BaseRepository {
  AttendanceRepository(super.networkInfo);

  final remote = locator<AttendanceRemote>();

  EitherResponse<PaginatedAttendance> history(int page) async {
    return handleNetworkCall(
      call: remote.history(),
      onSuccess: (r) => r,
    );
  }

  EitherResponse<bool> today() async {
    return handleNetworkCall(
      call: remote.today(),
      onSuccess: (r) => r,
    );
  }

  EitherResponse<void> submit(FormData data) async {
    return handleNetworkCall(
      call: remote.submit(data),
      onSuccess: (r) => r,
    );
  }
}
