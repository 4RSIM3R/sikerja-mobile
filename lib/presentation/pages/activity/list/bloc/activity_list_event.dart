part of 'activity_list_bloc.dart';

abstract class ActivityListEvent extends Equatable {
  const ActivityListEvent();

  @override
  List<Object> get props => [];
}

class ActivityListFetch extends ActivityListEvent {}
