import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alice/alice.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:next_starter/data/datasources/remote_datasources/activity_remote/activity_remote.dart';
import 'package:next_starter/data/datasources/remote_datasources/activity_remote/activity_remote_impl.dart';
import 'package:next_starter/data/datasources/remote_datasources/announcement_remote/announcement_remote.dart';
import 'package:next_starter/data/datasources/remote_datasources/announcement_remote/announcement_remote_impl.dart';
import 'package:next_starter/data/datasources/remote_datasources/attendance_remote/attendance_remote.dart';
import 'package:next_starter/data/datasources/remote_datasources/attendance_remote/attendance_remote_impl.dart';
import 'package:next_starter/data/datasources/remote_datasources/setting_remote/setting_remote.dart';
import 'package:next_starter/data/datasources/remote_datasources/setting_remote/setting_remote_impl.dart';
import 'package:next_starter/data/repositories/activity_repository.dart';
import 'package:next_starter/data/repositories/announcement_repository.dart';
import 'package:next_starter/data/repositories/attendance_repository.dart';
import 'package:next_starter/data/repositories/setting_repository.dart';
import 'package:next_starter/presentation/pages/activity/attendance/bloc/attendance_bloc.dart';
import 'package:next_starter/presentation/pages/activity/list/bloc/activity_list_bloc.dart';

import 'application/auth/auth_cubit.dart';
import 'common/network/network_info.dart';
import 'common/permission/permission.dart';
import 'common/permission/permission_impl.dart';
import 'common/storage/shared_pref_storage.dart';
import 'common/storage/storage.dart';
import 'common/storage/storage_path.dart';
import 'common/utils/image_resize.dart';
import 'data/datasources/network/network_source.dart';
import 'data/datasources/remote_datasources/auth_remote/auth_remote.dart';
import 'data/datasources/remote_datasources/auth_remote/auth_remote_impl.dart';
import 'data/datasources/session/session_source.dart';
import 'data/repositories/auth_repository.dart';
import 'presentation/router/app_router.dart';

final locator = GetIt.instance;

class ApiServiceImpl extends ApiService {}

Future<void> initializeDependencies(GlobalKey<NavigatorState> navigatorKey) async {
  final apiService = ApiServiceImpl();
  final alice = Alice(showNotification: true, navigatorKey: navigatorKey);

  locator.registerLazySingleton<AppRouter>(() => AppRouter());
  locator.registerLazySingleton<Dio>(() => apiService.dio()..interceptors.add(alice.getDioInterceptor()));
  locator.registerLazySingleton<ImagePicker>(() => apiService.imagePicker);
  locator.registerFactoryAsync<StoragePathInterface>(apiService.init);
  locator.registerLazySingleton<ImageResizeUtils>(() => ImageResizeUtils());
  locator.registerLazySingleton<Connectivity>(() => apiService.internetConnectionChecker());
  locator.registerSingleton<NetworkInfo>(NetworkInfoImpl(locator.get()));
  locator.registerLazySingleton<PermissionInterface>(() => const KendaliPermission());
  locator.registerSingleton<SharedPrefStorageInterface>(SharedPreferenceStorage());
  locator.registerLazySingleton<StorageInterface>(() => Storage(permission: locator.get(), storagePath: locator.get()));
  locator.registerLazySingleton<SessionSource>(() => SessionSource(shared: locator()));

  // auth
  locator.registerSingleton<AuthRemote>(AuthRemoteImpl(locator.get(), locator.get()));
  locator.registerSingleton(AuthRepository(locator.get()));
  locator.registerFactory(AuthCubit.new);

  // activity
  locator.registerSingleton<ActivityRemote>(ActivityRemoteImpl(locator.get(), locator.get()));
  locator.registerSingleton(ActivityRepository(locator.get()));
  locator.registerFactory(ActivityListBloc.new);
  locator.registerFactory(AttendanceBloc.new);

  // announcement
  locator.registerSingleton<AnnouncementRemote>(AnnouncementRemoteImpl(locator.get(), locator.get()));
  locator.registerSingleton(AnnouncementRepository(locator.get()));

  // setting
  locator.registerSingleton<SettingRemote>(SettingRemoteImpl(locator.get(), locator.get()));
  locator.registerSingleton(SettingRepository(locator.get()));

  // attendance
  locator.registerSingleton<AttendanceRemote>(AttendanceRemoteImpl(locator.get(), locator.get()));
  locator.registerSingleton(AttendanceRepository(locator.get()));
}
