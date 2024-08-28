part of 'activity_list_bloc.dart';

enum ActivityListStatus { initial, success, failure }

class ActivityListState extends Equatable {
  const ActivityListState({
    this.page = 1,
    this.status = ActivityListStatus.initial,
    this.activities = const <Activity>[],
    this.hasReachedMax = false,
    this.errorMessage = "",
  });

  final ActivityListStatus status;
  final List<Activity> activities;
  final bool hasReachedMax;
  final String errorMessage;
  final int page;

  ActivityListState copyWith({
    ActivityListStatus? status,
    List<Activity>? activities,
    bool? hasReachedMax,
    String? errorMessage,
    int? page,
  }) {
    return ActivityListState(
      status: status ?? this.status,
      activities: activities ?? this.activities,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [status, activities, hasReachedMax, page];
}
