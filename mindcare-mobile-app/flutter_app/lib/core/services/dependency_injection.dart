import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/api_client.dart';
import '../network/dio_client.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/location/data/datasources/location_datasource.dart';
import '../../features/location/data/repositories/location_repository_impl.dart';
import '../../features/location/domain/repositories/location_repository.dart';
import '../../features/location/domain/usecases/get_location_usecase.dart';
import '../../features/location/presentation/bloc/location_bloc.dart';
import '../../features/notifications/data/datasources/notification_datasource.dart';
import '../../features/notifications/data/repositories/notification_repository_impl.dart';
import '../../features/notifications/domain/repositories/notification_repository.dart';
import '../../features/notifications/domain/usecases/send_notification_usecase.dart';
import '../../features/notifications/presentation/bloc/notification_bloc.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    // External dependencies
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(sharedPreferences);
    
    // Network
    getIt.registerSingleton<Dio>(DioClient.dio);
    getIt.registerSingleton<ApiClient>(ApiClient(getIt<Dio>()));
    
    // Auth feature
    getIt.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl(getIt<ApiClient>()),
    );
    getIt.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
    );
    getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(getIt<AuthRepository>()),
    );
    getIt.registerFactory<AuthBloc>(
      () => AuthBloc(getIt<LoginUseCase>()),
    );
    
    // Location feature
    getIt.registerSingleton<LocationDataSource>(LocationDataSourceImpl());
    getIt.registerSingleton<LocationRepository>(
      LocationRepositoryImpl(getIt<LocationDataSource>()),
    );
    getIt.registerSingleton<GetLocationUseCase>(
      GetLocationUseCase(getIt<LocationRepository>()),
    );
    getIt.registerFactory<LocationBloc>(
      () => LocationBloc(getIt<GetLocationUseCase>()),
    );
    
    // Notification feature
    getIt.registerSingleton<NotificationDataSource>(NotificationDataSourceImpl());
    getIt.registerSingleton<NotificationRepository>(
      NotificationRepositoryImpl(getIt<NotificationDataSource>()),
    );
    getIt.registerSingleton<SendNotificationUseCase>(
      SendNotificationUseCase(getIt<NotificationRepository>()),
    );
    getIt.registerFactory<NotificationBloc>(
      () => NotificationBloc(getIt<SendNotificationUseCase>()),
    );
  }
}