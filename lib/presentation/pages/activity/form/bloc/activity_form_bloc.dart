import 'package:bloc/bloc.dart';
import 'package:next_starter/presentation/pages/activity/form/bloc/activity_form_state.dart';

class ActivityFormBloc extends Cubit<ActivityFormState> {
  ActivityFormBloc() : super(ActivityFormInitial());

  Future<void> submit() async {
    emit(ActivityFormLoading());

    await Future.delayed(const Duration(seconds: 1));

    emit(ActivityFormSuccess());
  }
}
