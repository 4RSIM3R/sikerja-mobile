part of 'announcement_bloc.dart';

enum AnnouncementStatus { initial, success, failure }

class AnnouncementState extends Equatable {
  const AnnouncementState({
    this.page = 1,
    this.status = AnnouncementStatus.initial,
    this.announcements = const <Announcement>[],
    this.hasReachedMax = false,
    this.errorMessage = "",
  });

  final AnnouncementStatus status;
  final List<Announcement> announcements;
  final bool hasReachedMax;
  final String errorMessage;
  final int page;

  AnnouncementState copyWith({
    AnnouncementStatus? status,
    List<Announcement>? announcements,
    bool? hasReachedMax,
    String? errorMessage,
    int? page,
  }) {
    return AnnouncementState(
      status: status ?? this.status,
      announcements: announcements ?? this.announcements,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [status, announcements, hasReachedMax, page];
}
