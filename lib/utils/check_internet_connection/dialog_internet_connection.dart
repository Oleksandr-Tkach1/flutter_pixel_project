import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/check_internet_connection_bloc.dart';
import 'bloc/check_internet_connection_state.dart';
import 'widget/dialog_details.dart';

class DialogInternetConnection extends StatelessWidget {
  const DialogInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ObserveDialog.appLoader.loaderShowingNotifier,
      builder: (context, value, child) {
        if (value) {
          return showDialog(context);
        } else {
          return Container();
        }
      },
    );
  }

  showDialog(BuildContext context) {
    return BlocBuilder<CheckInternetConnectionBloc,
        CheckInternetConnectionState>(
      builder: (context, state) {
        if (state is InternetDisconnected) {
          return const DialogDetails(color: Colors.red, internetStatus: 'No Internet connection!');
        } else if (state is InternetConnected) {
          return const DialogDetails(color: Colors.green, internetStatus: 'Internet connected!');
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class ObserveDialog {
  static final ObserveDialog appLoader = ObserveDialog();
  ValueNotifier<bool> loaderShowingNotifier = ValueNotifier(true);

  void showDialog() {
    loaderShowingNotifier.value = true;
  }

  void removeDialog() {
    loaderShowingNotifier.value = false;
  }
}