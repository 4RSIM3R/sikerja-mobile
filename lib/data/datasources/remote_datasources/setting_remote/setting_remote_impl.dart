import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/data/datasources/remote_datasources/setting_remote/setting_remote.dart';

class SettingRemoteImpl extends BaseDioRemoteSource implements SettingRemote {
  SettingRemoteImpl(super.dio, super.session);
}
