import 'package:bloc/bloc.dart';
import 'package:e_election/app/di/injector.dart';
import 'package:e_election/services/app_user_service.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashSetup>(_onSplashSetup);
  }

  final AppUserService _appUserService = injector<AppUserService>();
  Future<void> _onSplashSetup(
    SplashSetup event,
    Emitter<SplashState> emit,
  ) async {
    try {
      //For display splash screen
      await Future.delayed(const Duration(seconds: 2));

      bool? isAppInitialized = await _appUserService.isAppInitialized();
      emit(SplashCompleted(isAppInitialized ?? false));
    } catch (e) {
      emit(const SplashCompleted(false));
    }
  }
}
