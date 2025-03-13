part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashCompleted extends SplashState {
  final bool isAppInitialized;

  const SplashCompleted(this.isAppInitialized);

  @override
  List<Object> get props => [isAppInitialized];

  @override
  String toString() {
    return 'SplashCompleted{isAppInitialized: ${isAppInitialized}}';
  }
}
