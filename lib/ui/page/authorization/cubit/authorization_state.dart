import 'package:equatable/equatable.dart';

enum AuthorizationStatus { initial, error, complete, loading }

class AuthorizationState extends Equatable {
  final AuthorizationStatus status;
  final String errorMessage;
  final String email;
  final String confirmCode;

  const AuthorizationState({
    this.status = AuthorizationStatus.initial,
    this.errorMessage = '',
    this.email = '',
    this.confirmCode = '',
  });

  AuthorizationState copyWith({
    AuthorizationStatus? status,
    String? errorMessage,
    String? email,
    String? confirmCode,
    bool? emailIsValid,
  }) {
    return AuthorizationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      confirmCode: confirmCode ?? this.confirmCode,
    );
  }

  @override
  List<Object> get props =>
      [email, status, errorMessage, confirmCode];
}