part of 'phone_verification_cubit.dart';

sealed class PhoneVerificationState extends Equatable {
  const PhoneVerificationState();

  @override
  List<Object> get props => [];
}

final class PhoneVerificationInitial extends PhoneVerificationState {}

final class PhoneVerificationLoading extends PhoneVerificationState {}

final class PhoneVerificationSuccess extends PhoneVerificationState {
  final PassPortVerificationModel passPortVerificationModel;
  PhoneVerificationSuccess(this.passPortVerificationModel);

  @override
  List<Object> get props => [passPortVerificationModel];
}

final class PhoneVerificationFailure extends PhoneVerificationState {
  final String message;

  const PhoneVerificationFailure(this.message);

  @override
  List<Object> get props => [message];
}
