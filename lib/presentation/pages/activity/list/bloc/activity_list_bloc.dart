import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:next_starter/common/utils/bloc_utils.dart';
import 'package:next_starter/data/models/activity/activity_model.dart';
import 'package:next_starter/data/repositories/activity_repository.dart';
import 'package:next_starter/injection.dart';

part 'activity_list_event.dart';
part 'activity_list_state.dart';

class ActivityListBloc extends Bloc<ActivityListEvent, ActivityListState> {
  final repo = locator<ActivityRepository>();

  ActivityListBloc() : super(const ActivityListState()) {
    on<ActivityListFetch>(
      _onActivityListFetch,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  FutureOr<void> _onActivityListFetch(ActivityListFetch event, Emitter<ActivityListState> emit) async {
    if (state.hasReachedMax) return;
    final post = await repo.all(state.page);
    post.fold(
      (l) => emit(state.copyWith(status: ActivityListStatus.failure, errorMessage: l.message)),
      (r) {
        emit(
          (r.data?.items?.length ?? 0) < 10
              ? state.copyWith(
                  status: ActivityListStatus.success,
                  hasReachedMax: true,
                  activities: List.of(state.activities)..addAll(r.data?.items ?? []),
                )
              : state.copyWith(
                  status: ActivityListStatus.success,
                  activities: List.of(state.activities)..addAll(r.data?.items ?? []),
                  hasReachedMax: false,
                  page: state.page + 1,
                ),
        );
      },
    );
    return null;
  }
}
