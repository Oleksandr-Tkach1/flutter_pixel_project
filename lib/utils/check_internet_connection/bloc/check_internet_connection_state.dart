import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum InternetConnectionStatus{ initial, internetConnected, internetDisconnected }

class CheckInternetConnectionState extends Equatable {
  final InternetConnectionStatus status;
  final bool internetConnection;
  late ValueNotifier<bool>? loaderShowingNotifier;

  CheckInternetConnectionState({
    this.status = InternetConnectionStatus.initial,
    this.internetConnection = false,
    this.loaderShowingNotifier,
});

  CheckInternetConnectionState copyWith({
    InternetConnectionStatus? status,
    bool? internetConnection,
    ValueNotifier<bool>? loaderShowingNotifier,
  }) {
    return CheckInternetConnectionState(
      status: status ?? this.status,
      internetConnection: internetConnection ?? this.internetConnection,
      loaderShowingNotifier: loaderShowingNotifier ?? this.loaderShowingNotifier,
    );
  }
  @override
  List<Object?> get props => [status, internetConnection, loaderShowingNotifier];
}