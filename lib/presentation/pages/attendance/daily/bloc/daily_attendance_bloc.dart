import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:next_starter/presentation/pages/attendance/daily/bloc/daily_attendance_state.dart';

class DailyAttendanceBloc extends Cubit<DailyAttendanceState> {
  DailyAttendanceBloc() : super(DailyAttendanceInitialState());


  Future<void> submit({required String path, required Position position}) async {

  }
  
}