import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/common/utils/api_path.dart';
import 'package:next_starter/data/datasources/remote_datasources/assignment_remote/assignment_remote.dart';
import 'package:next_starter/data/models/assignment/assignment_model.dart';

class AssignmentRemoteImpl extends BaseDioRemoteSource implements AssignmentRemote {
  AssignmentRemoteImpl(super.dio, super.session);

  @override
  Future<PaginatedAssignment> get(int page) async {
    return networkRequest(
      request: (dio) => dio.get(ApiPath.activity),
      onResponse: (response) => PaginatedAssignment.fromJson(response),
    );
  }
}
