import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../main.dart';
import '../bloc/check_internet_connection_bloc.dart';
import '../bloc/check_internet_connection_event.dart';

class ObserveNetworkConnect {
  static void observeNetworkDetails() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        CheckInternetConnectionBloc().add(ConnectionNotify());
        BlocProvider.of<CheckInternetConnectionBloc>(MainAppState.getContext()).showDialog();
      } else {
        CheckInternetConnectionBloc().add(ConnectionNotify(isConnected: true));
        BlocProvider.of<CheckInternetConnectionBloc>(MainAppState.getContext()).removeDialog();
      }
    });
  }
}