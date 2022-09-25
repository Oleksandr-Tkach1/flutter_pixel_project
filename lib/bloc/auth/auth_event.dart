import 'package:equatable/equatable.dart';

enum AuthenticationType {
  uninitialized,
  credentials,
}

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]);
}

class AppStarted extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AppStarted';
}

class AppLoaded extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AppLoaded';
}

class LoggedOut extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoggedOut';
}

class LoggedIn extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoggedIn';
}