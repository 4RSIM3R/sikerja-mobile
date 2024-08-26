import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/common/typedefs/typedefs.dart';
import 'package:next_starter/data/datasources/remote_datasources/assignment_remote/assignment_remote.dart';
import 'package:next_starter/data/models/assignment/assignment_model.dart';
import 'package:next_starter/injection.dart';

class AssignmentRepository extends BaseRepository {
  AssignmentRepository(super.networkInfo);

  final remote = locator<AssignmentRemote>();

  EitherResponse<PaginatedAssignment> get(int page) {
    return handleNetworkCall(
      call: remote.get(page),
      onSuccess: (r) => r,
    );
  }
}
