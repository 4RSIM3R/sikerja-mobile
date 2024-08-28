part of 'history_attendance_bloc.dart';

abstract class HistoryAttendanceEvent extends Equatable {
  const HistoryAttendanceEvent();

  @override
  List<Object> get props => [];
}

class HistoryAttendanceFetch extends HistoryAttendanceEvent {}
