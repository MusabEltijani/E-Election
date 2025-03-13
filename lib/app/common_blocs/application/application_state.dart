part of 'application_bloc.dart';

sealed class ApplicationState {}

final class ApplicationInitial extends ApplicationState {}

class ApplicationCompleted extends ApplicationState {
  final bool isAppInitialized;

  ApplicationCompleted({required this.isAppInitialized});

  @override
  String toString() {
    return 'ApplicationCompleted{isAppInitialized: $isAppInitialized}';
  }
}
