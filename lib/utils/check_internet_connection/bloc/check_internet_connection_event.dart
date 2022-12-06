abstract class CheckInternetConnectionEvent {}

class ConnectionObserve extends CheckInternetConnectionEvent {}

class ConnectionNotify extends CheckInternetConnectionEvent {
  final bool isConnected;
  ConnectionNotify({this.isConnected = false});
}