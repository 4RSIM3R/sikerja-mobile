import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:next_starter/common/utils/bloc_utils.dart';
import 'package:next_starter/data/models/assignment/assignment_model.dart';
import 'package:next_starter/data/repositories/assignment_repository.dart';
import 'package:next_starter/injection.dart';

part 'assignment_event.dart';
part 'assignment_state.dart';

class AssignmentBloc extends Bloc<AssignmentEvent, AssignmentState> {
  final repo = locator<AssignmentRepository>();

  AssignmentBloc() : super(const AssignmentState()) {
    on<AssignmentFetch>(
      _onAssignmentFetch,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  FutureOr<void> _onAssignmentFetch(AssignmentFetch event, Emitter<AssignmentState> emit) async {
    if (state.hasReachedMax) return;
    final post = await repo.get(state.page);
    post.fold(
      (l) => emit(state.copyWith(status: AssignmentStatus.failure, errorMessage: l.message)),
      (r) {
        emit(
          (r.data?.items?.length ?? 0) < 10
              ? state.copyWith(
                  status: AssignmentStatus.success,
                  hasReachedMax: true,
                  assignments: List.of(state.assignments)..addAll(r.data?.items ?? []),
                )
              : state.copyWith(
                  status: AssignmentStatus.success,
                  assignments: List.of(state.assignments)..addAll(r.data?.items ?? []),
                  hasReachedMax: false,
                  page: state.page + 1,
                ),
        );
      },
    );
    return null;
  }
}
