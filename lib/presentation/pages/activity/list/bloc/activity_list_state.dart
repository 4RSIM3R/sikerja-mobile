part of 'activity_list_bloc.dart';

enum ActivityListStatus { initial, success, failure }

class ActivityListState extends Equatable {
  const ActivityListState({
    this.page = 1,
    this.status = ActivityListStatus.initial,
    this.posts = const <ActivityModel>[],
    this.hasReachedMax = false,
    this.errorMessage = "",
  });

  final ActivityListStatus status;
  final List<ActivityModel> posts;
  final bool hasReachedMax;
  final String errorMessage;
  final int page;

  ActivityListState copyWith({
    ActivityListStatus? status,
    List<ActivityModel>? posts,
    bool? hasReachedMax,
    String? errorMessage,
    int? page,
  }) {
    return ActivityListState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax, page];
}
