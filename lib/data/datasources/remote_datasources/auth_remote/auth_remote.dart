import '../../../models/auth/session_model.dart';

abstract class AuthRemote {
  Future<SessionModel> login({required String email, required String password});
  Future<void> logout();
}
