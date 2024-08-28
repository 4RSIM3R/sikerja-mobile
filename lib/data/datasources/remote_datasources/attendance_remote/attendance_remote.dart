import 'package:dio/dio.dart';
import 'package:next_starter/data/models/attendance/attendance_model.dart';

abstract class AttendanceRemote {
  Future<PaginatedAttendance> history();
  Future<bool> today();
  Future<void> submit(FormData data);
}
