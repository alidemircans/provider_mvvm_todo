import 'package:get_it/get_it.dart';
import 'package:todo/helper/shared_preference_instance.dart';
import 'package:todo/repository/todo_repository.dart';
import 'package:todo/repository/user_repository.dart';
import 'package:todo/service/todo_service.dart';
import 'package:todo/service/user_service.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => TodoApiService());
  locator.registerLazySingleton(() => TodoRepository());
  locator.registerLazySingleton(() => UserApiService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => SharedPreferencesInstance());
}
