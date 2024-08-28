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

    // final response = await repo.submit(path, position);

    // response.fold(
    //   (l) => emit(DailyAttendanceFailureState(l.message)),
    //   (r) => emit(DailyAttendanceSuccessState()),
    // );
  }
}