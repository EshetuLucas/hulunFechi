// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../api/get_apis.dart';
import '../api/post_apis.dart';
import '../api/put_apis.dart';
import '../services/cloud_storage_service.dart';
import '../services/crop_image_service.dart';
import '../services/event_service.dart';
import '../services/media_services.dart';
import '../services/post_service.dart';
import '../services/shared_preferences_service.dart';
import '../services/user_service.dart';

final locator = StackedLocator.instance;

Future setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => GetApis());
  locator.registerLazySingleton(() => PostApi());
  locator.registerLazySingleton(() => PutApis());
  locator.registerLazySingleton(() => EventService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => CropImageService());
  locator.registerLazySingleton(() => MediaService());
  locator.registerLazySingleton(() => CloudStorageService());
  final sharedPreferencesService = await SharedPreferencesService.getInstance();
  locator.registerSingleton(sharedPreferencesService);
}
