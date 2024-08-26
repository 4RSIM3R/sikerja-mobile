import 'package:dio/dio.dart';
import 'package:next_starter/data/models/activity/activity_model.dart';

abstract class ActivityRemote {
  Future<PaginateActivityModel> all(int page);
  Future<void> evidence(int id, FormData data);
}
