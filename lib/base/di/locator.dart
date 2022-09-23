import 'package:get_it/get_it.dart';

import '../../remote/local/shared_prefs.dart';
import '../../remote/service/api_client.dart';

GetIt locator = GetIt.instance;

void setUpInjector() {
  locator.registerLazySingleton(() => SharedPrefs());
  locator.registerLazySingleton(() => ApiClient());
}
