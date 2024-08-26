import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/common/utils/api_path.dart';
import 'package:next_starter/data/datasources/remote_datasources/setting_remote/setting_remote.dart';
import 'package:next_starter/data/models/setting/setting_model.dart';

class SettingRemoteImpl extends BaseDioRemoteSource implements SettingRemote {
  SettingRemoteImpl(super.dio, super.session);

  @override
  Future<SettingModel> get() async {
    return networkRequest(
      request: (dio) => dio.get(ApiPath.activity),
      onResponse: (response) => SettingModel.fromJson(response['data']),
      isAuth: true,
    );
  }
}
