part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final UserDataEntity userDataEntity;

  const LoggedIn({required this.userDataEntity});
}

class LoggedOut extends AuthenticationEvent {}
