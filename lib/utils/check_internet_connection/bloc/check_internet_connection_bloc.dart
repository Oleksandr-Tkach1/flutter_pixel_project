import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/observe_network_connect.dart';
import 'check_internet_connection_event.dart';
import 'check_internet_connection_state.dart';

class CheckInternetConnectionBloc extends Bloc<CheckInternetConnectionEvent, CheckInternetConnectionState> {
  CheckInternetConnectionBloc._() : super(CheckInternetConnectionState(status: InternetConnectionStatus.initial)) {
    on<ConnectionObserve>(_observe);
    on<ConnectionNotify>(_notifyStatus);
  }

  static final CheckInternetConnectionBloc _instance = CheckInternetConnectionBloc._();
  factory CheckInternetConnectionBloc() => _instance;

  void _observe(event, emit) {
    ObserveNetworkConnect.observeNetworkDetails();
  }

  void _notifyStatus(ConnectionNotify event, emit) {
    event.isConnected
        ? emit(state.copyWith(status: InternetConnectionStatus.internetConnected))
        : emit(state.copyWith(status: InternetConnectionStatus.internetDisconnected));
  }

  void showDialog() {
    emit(state.copyWith(loaderShowingNotifier: ValueNotifier(true)));
  }

  void removeDialog() {
    emit(state.copyWith(loaderShowingNotifier: ValueNotifier(false)));
  }
}