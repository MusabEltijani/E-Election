import 'package:bloc/bloc.dart';
import 'package:e_election/app/di/injector.dart';
import 'package:e_election/generated/locale_keys.g.dart';
import 'package:e_election/services/app_user_service.dart';
import 'package:e_election/services/candidates_service.dart';
import 'package:e_election/utils/network_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'candidate_details_state.dart';

class CandidateDetailsCubit extends Cubit<CandidateDetailsState> {
  CandidateDetailsCubit() : super(CandidateDetailsInitial());

  final CandidatesService candidatesService = injector<CandidatesService>();

  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;

  final AppUserService appUserService = injector<AppUserService>();

  Future<void> vote(String candidateId) async {
    emit(CandidatevoteLoading());
    try {
      final token = await appUserService.getToken();

      debugPrint(token);
      final response = await candidatesService.vote(
        candidateId,
        'Bearer $token',
      );
      if (response != null) {
        emit(CandidatevoteLoaded());
      } else {
        emit(CandidatevoteError(message: LocaleKeys.error_no_connection.tr()));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(CandidatevoteError(message: e.toString()));
    }
  }
}
