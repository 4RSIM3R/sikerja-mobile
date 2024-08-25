import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:next_starter/data/repositories/activity_repository.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/pages/activity/attendance/bloc/attendance_state.dart';

class AttendanceBloc extends Cubit<AttendanceState> {
  AttendanceBloc() : super(AttendanceInitialState());

  final repository = locator<ActivityRepository>();

  Future<void> submit({
    required int id,
    required bool report,
    required List<XFile> files,
  }) async {
    emit(AttendanceLoadingState());

    Map<String, dynamic> payload = {
      'show_in_report': report,
    };

    for (final file in files) {
      payload.addAll({
        'image[${files.indexOf(file)}]': await MultipartFile.fromFile(file.path, filename: file.name),
      });
    }

    final response = await repository.submit(id, FormData.fromMap(payload));

    response.fold(
      (l) => emit(AttendanceErrorState(message: l.message)),
      (r) => emit(AttendanceSuccessState()),
    );
  }
}
