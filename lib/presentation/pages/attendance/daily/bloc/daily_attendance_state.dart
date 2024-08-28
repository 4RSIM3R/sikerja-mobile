abstract class DailyAttendanceState {}

class DailyAttendanceInitialState extends DailyAttendanceState {}

class DailyAttendanceLoadingState extends DailyAttendanceState {}

class DailyAttendanceLoadedState extends DailyAttendanceState {}

class DailyAttendanceFailureState extends DailyAttendanceState {
  final String message;

  DailyAttendanceFailureState(this.message);
}
class DailyAttendanceSuccessState extends DailyAttendanceState {}