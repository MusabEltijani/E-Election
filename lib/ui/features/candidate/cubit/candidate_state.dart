part of 'candidate_cubit.dart';

abstract class CandidateState extends Equatable {
  const CandidateState();

  @override
  List<Object?> get props => [];
}

class CandidateInitial extends CandidateState {}

class CandidateLoading extends CandidateState {}

class CandidateError extends CandidateState {
  final String message;

  const CandidateError({required this.message});

  @override
  List<Object> get props => [message];
}

class CandidateDataState extends CandidateState {
  final CandidatesResponseModel? candidates;
  final ProfileResponseModel? profile;
  final bool isLoading;
  final bool isLoadingProfile;
  final String? error;
  final bool hasMoreData;

  bool get isLoadingCandidates => isLoading;

  const CandidateDataState({
    this.candidates,
    this.profile,
    this.isLoading = false,
    this.isLoadingProfile = false,
    this.error,
    this.hasMoreData = true,
  });

  CandidateDataState copyWith({
    CandidatesResponseModel? candidates,
    ProfileResponseModel? profile,
    bool? isLoading,
    bool? isLoadingProfile,
    String? error,
    bool? hasMoreData,
  }) {
    return CandidateDataState(
      candidates: candidates ?? this.candidates,
      profile: profile ?? this.profile,
      isLoading: isLoading ?? this.isLoading,
      isLoadingProfile: isLoadingProfile ?? this.isLoadingProfile,
      error: error ?? this.error,
      hasMoreData: hasMoreData ?? this.hasMoreData,
    );
  }

  @override
  List<Object?> get props => [
        candidates,
        profile,
        isLoadingCandidates,
        isLoadingProfile,
        error,
        hasMoreData,
      ];
}
