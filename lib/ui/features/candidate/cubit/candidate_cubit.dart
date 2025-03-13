import 'package:bloc/bloc.dart';
import 'package:e_election/app/di/injector.dart';
import 'package:e_election/data/model/candidates_respones_model.dart';
import 'package:e_election/data/model/profile_respones_model.dart';
import 'package:e_election/generated/locale_keys.g.dart';
import 'package:e_election/services/app_user_service.dart';
import 'package:e_election/services/candidates_service.dart';
import 'package:e_election/services/profile_service.dart';
import 'package:e_election/utils/network_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

part 'candidate_state.dart';

class CandidateCubit extends Cubit<CandidateState> {
  CandidateCubit() : super(CandidateInitial());

  final CandidatesService candidatesService = injector<CandidatesService>();
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  final AppUserService appUserService = injector<AppUserService>();
  final ProfileService profileService = injector<ProfileService>();

  bool _isLoading = false;

  Future<void> getCandidates() async {
    if (_isLoading) return;

    try {
      _isLoading = true;
      emit(CandidateLoading());

      if (await _networkConnectivity.checkNetwork()) {
        final token = await appUserService.getToken();
        final CandidatesResponseModel? response =
            await candidatesService.getCandidates('Bearer $token');

        if (response != null) {
          emit(CandidateDataState(
            candidates: response,
            isLoading: false,
            hasMoreData: false,
          ));
        } else {
          emit(CandidateError(message: LocaleKeys.no_candidates.tr()));
        }
      } else {
        emit(CandidateError(message: LocaleKeys.error_no_connection.tr()));
      }
    } catch (e) {
      emit(CandidateError(message: e.toString()));
    } finally {
      _isLoading = false;
    }
  }

  Future<void> getProfile() async {
    try {
      if (await _networkConnectivity.checkNetwork()) {
        final token = await appUserService.getToken();
        final profile = await profileService.getProfile('Bearer $token');

        if (state is CandidateDataState) {
          final currentState = state as CandidateDataState;
          emit(currentState.copyWith(
            profile: profile,
            isLoadingProfile: false,
          ));
        } else {
          emit(CandidateDataState(
            profile: profile,
            isLoadingProfile: false,
          ));
        }
      } else {
        emit(CandidateError(message: LocaleKeys.error_no_connection.tr()));
      }
    } catch (e) {
      emit(CandidateError(message: e.toString()));
    }
  }

  Future<void> refreshData() async {
    await Future.wait([
      getCandidates(),
      getProfile(),
    ]);
  }
}
