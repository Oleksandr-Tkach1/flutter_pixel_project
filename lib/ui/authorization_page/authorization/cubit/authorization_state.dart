import 'package:equatable/equatable.dart';

enum AuthorizationStatus { initial, error, complete, loading }

enum AlertStatus {none, visibility}

class AuthorizationState extends Equatable {
  final AuthorizationStatus status;
  final String errorMessage;
  final String email;
  final String confirmCode;
  final int statusCode;
  final AlertStatus alertStatus;

  const AuthorizationState({
    this.status = AuthorizationStatus.initial,
    this.errorMessage = '',
    this.email = '',
    this.confirmCode = '',
    this.statusCode = 0,
    this.alertStatus = AlertStatus.none,
  });

  AuthorizationState copyWith({
    AuthorizationStatus? status,
    String? errorMessage,
    String? email,
    String? confirmCode,
    bool? emailIsValid,
    int? statusCode,
    AlertStatus? alertStatus,
  }) {
    return AuthorizationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      confirmCode: confirmCode ?? this.confirmCode,
      statusCode: statusCode ?? this.statusCode,
      alertStatus: alertStatus ?? this.alertStatus,
    );
  }

  @override
  List<Object> get props =>
      [email, status, errorMessage, confirmCode, statusCode, alertStatus];
}