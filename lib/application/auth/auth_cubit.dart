import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/auth_repository.dart';
import '../../injection.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepository repo = locator<AuthRepository>();

  Future<void> login(Map<String, dynamic> json) async {
    // final NotificationInterface notification = locator<NotificationInterface>();
    emit(AuthLoading());
    final result = await repo.login(json);
    await result.fold<FutureOr<void>>(
      (l) => emit(AuthError(l.message)),
      (r) async {
        emit(const AuthSuccess("Selamat datang kembali!"));
      },
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());
    final result = await repo.logout();
    result.fold(
      (l) => emit(AuthError(l.message)),
      (r) => emit(const AuthSuccessLogout("Berhasil keluar!")),
    );
  }
}
