part of 'on_boarding_cubit.dart';

sealed class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingLoading extends OnBoardingState {}

class OnBoardingLoaded extends OnBoardingState {
  final OnboardingResponseModel data;
  OnBoardingLoaded(this.data);
}

class OnBoardingError extends OnBoardingState {
  final String error;
  OnBoardingError(this.error);
}

class PageChangedState extends OnBoardingState {
  final bool isLast;
  PageChangedState(this.isLast);
}
