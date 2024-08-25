import '../../../../common/typedefs/typedefs.dart';
import '../../../../data/datasources/remote_datasources/auth_remote/auth_remote.dart';
import '../../../../data/datasources/session/session_source.dart';
import '../../../../data/models/auth/session_model.dart';
import '../../../../injection.dart';
import '../../common/base/base_repository.dart';

class AuthRepository extends BaseRepository {
  AuthRepository(super.networkInfo);

  final AuthRemote remote = locator();
  final SessionSource session = locator();

  EitherResponse<SessionModel> login(Map<String, dynamic> json) async {
    return handleNetworkCall(
      call: remote.login(
        email: json['email'].toString().trim(),
        password: json['password'].toString().trim(),
      ),
      onSuccess: (r) => r,
      onSaveToLocal: (data) => session.setToken(data.token ?? ''),
    );
  }

  EitherResponse<void> logout() async {
    return handleNetworkCall(
      call: Future.wait([
        session.deleteToken(),
        // remote.logout(),
      ]),
      onSuccess: (r) => r,
    );
  }
}
