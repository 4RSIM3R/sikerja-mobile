import 'dart:convert';

import 'package:next_starter/data/models/setting/setting_model.dart';

import '../../../common/storage/shared_pref_storage.dart';

class SessionSource {
  final SharedPrefStorageInterface shared;
  static const String _key = 'token';
  static const String _setting = 'userId';

  SessionSource({
    required this.shared,
  });

  Future<String?> get token async {
    return await shared.get(_key);
  }

  Future<SettingModel?> getSetting() async {
    final setting = await shared.get(_setting);
    if (setting == null) return null;
    return SettingModel.fromJson(jsonDecode(setting));
  }

  Future<void> setToken(String token) async {
    await shared.store(_key, token);
  }

  Future<void> setSetting(SettingModel setting) async {
    await shared.store(_setting, jsonEncode(setting.toJson()));
  }

  Future<void> deleteToken() async {
    await shared.remove(_key);
  }

  Future<void> deleteSetting() async {
    await shared.remove(_setting);
  }

  Future<bool> get hasSession async => await shared.hasData(_key);
}
