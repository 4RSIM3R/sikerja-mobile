part of 'history_attendance_bloc.dart';

enum HistoryAttendanceStatus { initial, success, failure }

class HistoryAttendanceState extends Equatable {
  const HistoryAttendanceState({
    this.page = 1,
    this.status = HistoryAttendanceStatus.initial,
    this.history = const <String>[],
    this.hasReachedMax = false,
    this.errorMessage = "",
  });

  final HistoryAttendanceStatus status;
  final List<String> history;
  final bool hasReachedMax;
  final String errorMessage;
  final int page;

  HistoryAttendanceState copyWith({
    HistoryAttendanceStatus? status,
    List<String>? history,
    bool? hasReachedMax,
    String? errorMessage,
    int? page,
  }) {
    return HistoryAttendanceState(
      status: status ?? this.status,
      history: history ?? this.history,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [status, history, hasReachedMax, page];
}
