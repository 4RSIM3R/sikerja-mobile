import 'package:next_starter/data/models/setting/setting_model.dart';

abstract class SettingRemote {
  Future<SettingModel> get();
}