import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:next_starter/common/utils/bloc_utils.dart';
import 'package:next_starter/data/models/attendance/attendance_model.dart';
import 'package:next_starter/data/repositories/attendance_repository.dart';
import 'package:next_starter/injection.dart';

part 'history_attendance_event.dart';
part 'history_attendance_state.dart';

class HistoryAttendanceBloc extends Bloc<HistoryAttendanceEvent, HistoryAttendanceState> {
  final repo = locator<AttendanceRepository>();

  HistoryAttendanceBloc() : super(const HistoryAttendanceState()) {
    on<HistoryAttendanceFetch>(
      _onHistoryAttendanceFetch,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  FutureOr<void> _onHistoryAttendanceFetch(HistoryAttendanceFetch event, Emitter<HistoryAttendanceState> emit) async {
    if (state.hasReachedMax) return;
    final post = await repo.history(state.page);
    post.fold(
      (l) => emit(state.copyWith(status: HistoryAttendanceStatus.failure, errorMessage: l.message)),
      (r) {
        emit(
          (r.data?.items?.length ?? 0) < 10
              ? state.copyWith(
                  status: HistoryAttendanceStatus.success,
                  hasReachedMax: true,
                  history: List.of(state.history)..addAll(r.data?.items ?? []),
                )
              : state.copyWith(
                  status: HistoryAttendanceStatus.success,
                  history: List.of(state.history)..addAll(r.data?.items ?? []),
                  hasReachedMax: false,
                  page: state.page + 1,
                ),
        );
      },
    );
    return null;
  }
}
