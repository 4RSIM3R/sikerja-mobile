import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:next_starter/common/utils/bloc_utils.dart';
import 'package:next_starter/data/models/announcement/announcement_model.dart';
import 'package:next_starter/data/repositories/announcement_repository.dart';
import 'package:next_starter/injection.dart';

part 'announcement_event.dart';
part 'announcement_state.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  final repo = locator<AnnouncementRepository>();

  AnnouncementBloc() : super(const AnnouncementState()) {
    on<AnnouncementFetch>(
      _onAnnouncementFetch,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  FutureOr<void> _onAnnouncementFetch(AnnouncementFetch event, Emitter<AnnouncementState> emit) async {
    if (state.hasReachedMax) return;
    final post = await repo.get(state.page);
    post.fold(
      (l) => emit(state.copyWith(status: AnnouncementStatus.failure, errorMessage: l.message)),
      (r) {
        emit(
          (r.data?.items?.length ?? 0) < 10
              ? state.copyWith(
                  status: AnnouncementStatus.success,
                  hasReachedMax: true,
                  announcements: List.of(state.announcements)..addAll(r.data?.items ?? []),
                )
              : state.copyWith(
                  status: AnnouncementStatus.success,
                  announcements: List.of(state.announcements)..addAll(r.data?.items ?? []),
                  hasReachedMax: false,
                  page: state.page + 1,
                ),
        );
      },
    );
    return null;
  }
}
