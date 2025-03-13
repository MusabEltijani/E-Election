part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final UserDataEntity userData;

  const Authenticated(this.userData);

  @override
  List<Object?> get props => [userData];
}

class Unauthenticated extends AuthenticationState {}
