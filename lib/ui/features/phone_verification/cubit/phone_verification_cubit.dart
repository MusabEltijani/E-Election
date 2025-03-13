import 'package:bloc/bloc.dart';
import 'package:e_election/app/di/injector.dart';
import 'package:e_election/data/model/generate_login_code_model.dart';
import 'package:e_election/data/model/pass_port_verification_model.dart';
import 'package:e_election/generated/locale_keys.g.dart';
import 'package:e_election/services/app_user_service.dart';
import 'package:e_election/services/authentication_service.dart';
import 'package:e_election/utils/network_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'phone_verification_state.dart';

class PhoneVerificationCubit extends Cubit<PhoneVerificationState> {
  final String passportNumber;

  PhoneVerificationCubit({required this.passportNumber})
      : super(PhoneVerificationInitial());

  final AuthenticationService authenticationService =
      injector<AuthenticationService>();

  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;

  final AppUserService appUserService = injector<AppUserService>();

  Future<void> verifyCode(String code, String passportNumber) async {
    // Validate code is exactly 4 digits
    if (code.length != 4 || !RegExp(r'^[0-9]{4}$').hasMatch(code)) {
      emit(PhoneVerificationFailure(LocaleKeys.error_invalid_code.tr()));
      return;
    }

    emit(PhoneVerificationLoading());

    try {
      if (await _networkConnectivity.checkNetwork()) {
        final PassPortVerificationModel isPassportNumberValid =
            await authenticationService.verificationLoginCode(
                passportNumber, code);
        // If all validation passes
        if (isPassportNumberValid.message == 'authenticated') {
          appUserService.saveToken(isPassportNumberValid.data.token);

          emit(PhoneVerificationSuccess(isPassportNumberValid));
        } else {
          emit(PhoneVerificationFailure(isPassportNumberValid.message));
        }
      } else {
        emit(PhoneVerificationFailure(LocaleKeys.error_no_connection.tr()));
      }
    } catch (e) {
      emit(PhoneVerificationFailure(e.toString()));
    }
  }
}
