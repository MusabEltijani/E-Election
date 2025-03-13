import 'package:e_election/app/di/local_database_module.dart';
import 'package:e_election/app/di/service_module.dart';
import 'package:get_it/get_it.dart';
import 'endpoint_module.dart';
import 'repository_module.dart';

final GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await registerDatabase();
  await registerEndPoints();
  await registerRepositories();
  await registerService();
}
