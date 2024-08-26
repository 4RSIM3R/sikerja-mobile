part of 'assignment_bloc.dart';

enum AssignmentStatus { initial, success, failure }

class AssignmentState extends Equatable {
  const AssignmentState({
    this.page = 1,
    this.status = AssignmentStatus.initial,
    this.assignments = const <Assignment>[],
    this.hasReachedMax = false,
    this.errorMessage = "",
  });

  final AssignmentStatus status;
  final List<Assignment> assignments;
  final bool hasReachedMax;
  final String errorMessage;
  final int page;

  AssignmentState copyWith({
    AssignmentStatus? status,
    List<Assignment>? assignments,
    bool? hasReachedMax,
    String? errorMessage,
    int? page,
  }) {
    return AssignmentState(
      status: status ?? this.status,
      assignments: assignments ?? this.assignments,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [status, assignments, hasReachedMax, page];
}
