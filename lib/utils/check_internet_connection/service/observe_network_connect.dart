import 'package:connectivity_plus/connectivity_plus.dart';
import '../bloc/check_internet_connection_bloc.dart';
import '../bloc/check_internet_connection_event.dart';
import '../dialog_internet_connection.dart';

class ObserveNetworkConnect {
  static void observeNetworkDetails() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        ObserveDialog.appLoader.showDialog();
        CheckInternetConnectionBloc().add(ConnectionNotify());
      } else {
        ObserveDialog.appLoader.removeDialog();
        CheckInternetConnectionBloc().add(ConnectionNotify(isConnected: true));
      }
    });
  }
}