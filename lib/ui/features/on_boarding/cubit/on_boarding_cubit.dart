import 'package:bloc/bloc.dart';
import 'package:e_election/app/di/injector.dart';
import 'package:e_election/data/data_exception.dart';
import 'package:e_election/data/model/on_boarding_respones_model.dart';
import 'package:e_election/generated/locale_keys.g.dart';
import 'package:e_election/services/on_boarding_service.dart';
import 'package:e_election/ui/features/scan_passport/scan_passport_screen.dart';
import 'package:e_election/utils/network_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final PageController pageController = PageController();
  bool isLast = false;

  OnBoardingCubit() : super(OnBoardingInitial());

  static OnBoardingCubit get(BuildContext context) => BlocProvider.of(context);
  final OnBoardingService _dashboardService = injector<OnBoardingService>();

  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;

  /// Fetch Intro Data
  void getOnBoardingData() async {
    emit(OnBoardingLoading());
    try {
      if (await _networkConnectivity.checkNetwork()) {
        OnboardingResponseModel? result =
            await _dashboardService.getOnBoarding();

        if (result?.message != null) {
          emit(OnBoardingLoaded(result!));
        } else {
          emit(OnBoardingError(result!.message));
        }
      } else {
        emit(OnBoardingError(LocaleKeys.error_no_connection.tr()));
      }
    } on BadRequestException catch (e) {
      emit(OnBoardingError(LocaleKeys.error_bad_request.tr()));
    } catch (e) {
      debugPrint(e.toString());
      emit(OnBoardingError(LocaleKeys.error_connection.tr()));
    }
  }

  /// Handle Page Change
  void onPageChanged(int index, int totalPages) {
    isLast = (index == totalPages - 1);
    emit(PageChangedState(isLast));
  }

  /// Navigate to Login
  void submit(BuildContext context) async {
    // await CacheHelper.saveData(key: 'onBoarding', value: true);
    // HelperFuncation().navigateAndFinish(context, LoginScreen());
    context.pushReplacementNamed(ScanPassportScreen.routeName);
  }
}
