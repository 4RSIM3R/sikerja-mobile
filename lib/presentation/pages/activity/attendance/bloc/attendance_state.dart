abstract class AttendanceState {}

class AttendanceInitialState extends AttendanceState {}

class AttendanceLoadingState extends AttendanceState {}

class AttendanceSuccessState extends AttendanceState {}

class AttendanceErrorState extends AttendanceState {
  final String message;

  AttendanceErrorState({this.message = ""});
}
