import '../../../../common/base/base_dio_remote_source.dart';
import '../../../../common/utils/api_path.dart';
import '../../../models/auth/session_model.dart';
import 'auth_remote.dart';

class AuthRemoteImpl extends BaseDioRemoteSource implements AuthRemote {
  AuthRemoteImpl(super.dio, super.session);

  @override
  Future<SessionModel> login({required String email, required String password}) {
    return networkRequest(
      request: (dio) => dio.post(
        ApiPath.login,
        data: {
          "email": email,
          "password": password,
        },
      ),
      onResponse: (response) {
        print(response);
        return SessionModel.fromMap(response['data']);
      },
      isAuth: false,
    );
  }

  @override
  Future<void> logout() {
    return networkRequest(
      request: (dio) => dio.post(ApiPath.logout),
      onResponse: (response) {},
      isAuth: true,
    );
  }
}
