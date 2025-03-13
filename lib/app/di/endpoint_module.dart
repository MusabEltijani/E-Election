import 'package:dio/dio.dart';
import 'package:e_election/data/remote/dio/dio_factory.dart';
import 'package:e_election/data/remote/service/api_service.dart';

import 'injector.dart';

Future<void> registerEndPoints() async {
  // Dio client
  injector.registerSingleton<Dio>(DioFactory().create());
  // Data - Remote
  injector.registerSingleton<ApiService>(ApiService(injector()));
}
