import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/common/typedefs/typedefs.dart';
import 'package:next_starter/data/datasources/remote_datasources/setting_remote/setting_remote.dart';
import 'package:next_starter/data/datasources/session/session_source.dart';
import 'package:next_starter/data/models/setting/setting_model.dart';
import 'package:next_starter/injection.dart';

class SettingRepository extends BaseRepository {
  SettingRepository(super.networkInfo);

  final remote = locator<SettingRemote>();
  final session = locator<SessionSource>();

  Future<EitherResponse<SettingModel>> get() async {
    return handleNetworkCall(
      call: remote.get(),
      onSuccess: (r) => r,
      onSaveToLocal: (r) async {
        await session.setSetting(r);
      },
    );
  }
}
