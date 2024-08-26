import 'package:next_starter/data/models/assignment/assignment_model.dart';

abstract class AssignmentRemote {
  Future<PaginatedAssignment> get(int page);
}