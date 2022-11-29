import 'package:equatable/equatable.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_event.dart';

enum AuthenticationStatus{ uninitialized, loading, authenticated, unauthenticated }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final AuthenticationType authenticationType;
  final String token;

  const AuthenticationState({
    this.status = AuthenticationStatus.uninitialized,
    this.authenticationType = AuthenticationType.uninitialized,
    this.token = '',
  });

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    AuthenticationType? authenticationType,
    String? token,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      authenticationType: authenticationType ?? this.authenticationType,
      token: token ?? this.token,
    );
  }
  @override
  List<Object> get props => [status, authenticationType, token];
}