import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:next_starter/data/repositories/attendance_repository.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/pages/attendance/daily/bloc/daily_attendance_state.dart';

class DailyAttendanceBloc extends Cubit<DailyAttendanceState> {
  DailyAttendanceBloc() : super(DailyAttendanceInitialState());

  final repo = locator<AttendanceRepository>();

  Future<void> submit({required String path, required Position position}) async {
    emit(DailyAttendanceLoadingState());

    final data = FormData.fromMap({
      'latitude': position.latitude.toString(),
      'longitude': position.longitude.toString(),
      'photo': await MultipartFile.fromFile(path),
      'work_hour': DateFormat('HH:mm').format(DateTime.now()),
    });

    final response = await repo.submit(data);

    response.fold(
      (l) => emit(DailyAttendanceFailureState(l.message)),
      (r) => emit(DailyAttendanceSuccessState()),
    );
  }
}
