import 'package:e_election/app/di/injector.dart';
import 'package:e_election/data/model/generate_login_code_model.dart';
import 'package:e_election/generated/locale_keys.g.dart';
import 'package:e_election/services/authentication_service.dart';
import 'package:e_election/utils/network_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'scan_passport_state.dart';

class ScanPassportCubit extends Cubit<ScanPassportState> {
  ScanPassportCubit() : super(ScanPassportInitial());

  final AuthenticationService authenticationService =
      injector<AuthenticationService>();

  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;

  Future<void> validatePassportNumber(String number) async {
    emit(ScanPassportLoading());

    // Remove any whitespace and make uppercase
    final cleanNumber = number.trim().toUpperCase();

    // Basic validation checks
    if (cleanNumber.isEmpty) {
      emit(const ScanPassportError('Please enter verification code'));
      return;
    }

    // Check if input contains only numbers
    if (!cleanNumber.contains(RegExp(r'^[0-9]+$'))) {
      emit(const ScanPassportError('Please enter only numbers'));
      return;
    }

    try {
      if (await _networkConnectivity.checkNetwork()) {
        final GenerateLoginCodeModel isPassportNumberValid =
            await authenticationService.generateLoginCode(cleanNumber);
        // If all validation passes
        if (isPassportNumberValid.message == 'code sent') {
          emit(ScanPassportSuccess(cleanNumber));
        } else {
          emit(ScanPassportError(isPassportNumberValid.message));
        }
      } else {
        emit(ScanPassportError(LocaleKeys.error_no_connection.tr()));
      }
    } catch (e) {
      emit(ScanPassportError(e.toString()));
    }
  }

  // Optional: Add method to validate using NFC
  Future<void> validatePassportNFC() async {
    emit(ScanPassportLoading());

    try {
      // Add your NFC reading logic here
      // This is a placeholder for NFC implementation
      await Future.delayed(const Duration(seconds: 2)); // Simulate NFC reading

      emit(const ScanPassportSuccess('NFC_VALIDATED'));
    } catch (e) {
      emit(ScanPassportError('NFC reading failed: ${e.toString()}'));
    }
  }
}
