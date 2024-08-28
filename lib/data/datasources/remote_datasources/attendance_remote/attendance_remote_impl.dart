import 'package:dio/dio.dart';
import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/common/utils/api_path.dart';
import 'package:next_starter/data/datasources/remote_datasources/attendance_remote/attendance_remote.dart';
import 'package:next_starter/data/models/attendance/attendance_model.dart';

class AttendanceRemoteImpl extends BaseDioRemoteSource implements AttendanceRemote {
  AttendanceRemoteImpl(super.dio, super.session);

  @override
  Future<PaginatedAttendance> history() async {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.get(ApiPath.attendance),
      onResponse: (response) => PaginatedAttendance.fromJson(response),
    );
  }

  @override
  Future<void> submit(FormData data) async {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.get(ApiPath.attendance),
      onResponse: (response) => PaginatedAttendance.fromJson(response),
    );
  }

  @override
  Future<bool> today() async {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.get(ApiPath.attendanceToday),
      onResponse: (response) => response['data'] == null,
    );
  }
  
}
