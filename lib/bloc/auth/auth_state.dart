import 'package:equatable/equatable.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_event.dart';

enum AuthenticationStatus{ uninitialized, loading, authenticated, unauthenticated }
enum InternetConnection { none, connect, notConnect }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final AuthenticationType authenticationType;
  final String token;
  final InternetConnection internetConnection;

  const AuthenticationState({
    this.status = AuthenticationStatus.uninitialized,
    this.authenticationType = AuthenticationType.uninitialized,
    this.token = '',
    this.internetConnection = InternetConnection.none,
  });

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    AuthenticationType? authenticationType,
    String? token,
    InternetConnection? internetConnection,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      authenticationType: authenticationType ?? this.authenticationType,
      token: token ?? this.token,
      internetConnection: internetConnection ?? this.internetConnection,
    );
  }
  @override
  List<Object> get props => [status, authenticationType, token, internetConnection];
}