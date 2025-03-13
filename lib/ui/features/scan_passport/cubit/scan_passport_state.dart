part of 'scan_passport_cubit.dart';

abstract class ScanPassportState extends Equatable {
  const ScanPassportState();

  @override
  List<Object> get props => [];
}

class ScanPassportInitial extends ScanPassportState {}

class ScanPassportLoading extends ScanPassportState {}

class ScanPassportSuccess extends ScanPassportState {
  final String passportNumber;

  const ScanPassportSuccess(this.passportNumber);

  @override
  List<Object> get props => [passportNumber];
}

class ScanPassportError extends ScanPassportState {
  final String message;

  const ScanPassportError(this.message);

  @override
  List<Object> get props => [message];
}
