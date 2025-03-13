import 'package:bloc/bloc.dart';
import 'package:e_election/app/common_blocs/application/application_event.dart';
import 'package:e_election/app/di/injector.dart';
import 'package:e_election/services/app_user_service.dart';

part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitial()) {
    on<SetupApplication>(_onSetupApplication);
  }

  final AppUserService _appUserService = injector<AppUserService>();

  Future<void> _onSetupApplication(
    SetupApplication event,
    Emitter<ApplicationState> emit,
  ) async {
    try {
      bool? isAppInitialized = await _appUserService.isAppInitialized();
      emit(ApplicationCompleted(isAppInitialized: isAppInitialized ?? false));
    } catch (e) {
      emit(ApplicationCompleted(isAppInitialized: false));
    }
  }
}
