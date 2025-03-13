import 'package:e_election/app/common_blocs/application/application_bloc.dart';
import 'package:e_election/app/common_blocs/authentication/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonBloc {
  /// Bloc
  static final applicationBloc = ApplicationBloc();
  static final authenticationBloc = AuthenticationBloc();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<ApplicationBloc>(
      create: (context) => applicationBloc,
    ),
    BlocProvider<AuthenticationBloc>(
      create: (context) => authenticationBloc,
    )
  ];

  /// Dispose
  static void dispose() {
    applicationBloc.close();
    authenticationBloc.close();
  }

  /// Singleton factory
  static final CommonBloc _instance = CommonBloc._internal();

  factory CommonBloc() {
    return _instance;
  }
  CommonBloc._internal();
}
