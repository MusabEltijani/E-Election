part of 'candidate_details_cubit.dart';

sealed class CandidateDetailsState extends Equatable {
  const CandidateDetailsState();

  @override
  List<Object> get props => [];
}

final class CandidateDetailsInitial extends CandidateDetailsState {}

final class CandidatevoteLoading extends CandidateDetailsState {}

final class CandidatevoteLoaded extends CandidateDetailsState {}

final class CandidatevoteError extends CandidateDetailsState {
  final String message;

  const CandidatevoteError({required this.message});

  @override
  List<Object> get props => [message];
}
