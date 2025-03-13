import 'package:bloc/bloc.dart';
import 'package:e_election/app/di/injector.dart';
import 'package:e_election/data/entity/user_entity_data.dart';
import 'package:e_election/services/app_user_service.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(Uninitialized()) {
    on<AuthenticationStarted>(_onAuthenticationStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  final AppUserService _appUserService = injector<AppUserService>();

  Future<void> _onAuthenticationStarted(
    AuthenticationStarted event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      bool? userIsLogin = await _appUserService.userIsLogin();
      if (userIsLogin != null && userIsLogin) {
        UserDataEntity? userData = await _appUserService.getUserData();

        if (userData != null) {
          emit(Authenticated(userData));
        } else {
          emit(Unauthenticated());
        }
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  Future<void> _onLoggedIn(
    LoggedIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _appUserService.saveUserLoginStatus(true);
      await _appUserService.saveUserData(event.userDataEntity);

      emit(Authenticated(event.userDataEntity));
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  Future<void> _onLoggedOut(
    LoggedOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _appUserService.saveUserLoginStatus(false);
      await _appUserService.removeUserData();

      emit(Unauthenticated());
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  @override
  Future close() async {
    return super.close();
  }
}
