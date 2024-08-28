abstract class ActivityFormState {}

class ActivityFormInitial extends ActivityFormState {}

class ActivityFormLoading extends ActivityFormState {}

class ActivityFormSuccess extends ActivityFormState {}

class ActivityFormFailure extends ActivityFormState {
  final String message;

  ActivityFormFailure(this.message);
}