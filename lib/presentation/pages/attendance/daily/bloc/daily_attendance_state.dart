abstract class DailyAttendanceState {}

class DailyAttendanceInitialState extends DailyAttendanceState {}

class DailyAttendanceLoadingState extends DailyAttendanceState {}

class DailyAttendanceLoadedState extends DailyAttendanceState {}

class DailyAttendanceErrorState extends DailyAttendanceState {
  final String message;

  DailyAttendanceErrorState(this.message);
}
