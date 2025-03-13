import 'package:e_election/data/local/local.prefs.dart';
import 'package:e_election/data/local/local_services.dart';

import 'injector.dart';

Future<void> registerDatabase() async {
  injector.registerLazySingleton<LocalService>(() => LocalService(injector()));

  injector.registerLazySingleton<LocalPrefs>(() => LocalPrefs());
}
