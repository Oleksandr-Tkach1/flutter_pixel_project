import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/check_internet_connection_bloc.dart';
import 'bloc/check_internet_connection_state.dart';
import 'widget/dialog_details.dart';

class DialogInternetConnection extends StatelessWidget {
  const DialogInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckInternetConnectionBloc, CheckInternetConnectionState>(
        builder: (context, state) {
          return ValueListenableBuilder<bool>(
            valueListenable: state.loaderShowingNotifier = ValueNotifier(true),
            builder: (context, value, child) {
                return FutureBuilder(
                    future: showDialog(context, state),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      if(snapshot.hasData){
                        return snapshot.data;
                      }
                      return Container();
                    }
                );
            },
          );
        });
  }

  showDialog(BuildContext context, CheckInternetConnectionState state) async{
    if(state.status == InternetConnectionStatus.initial){
      return const SizedBox.shrink();
    } else if (state.status == InternetConnectionStatus.internetDisconnected) {
      return const DialogDetails(
          color: Colors.red, internetStatus: 'No Internet connection!', removeTime: 0, removeDialogue: false);
    } else if (state.status == InternetConnectionStatus.internetConnected) {
        return const DialogDetails(
            color: Colors.green, internetStatus: 'Internet connected!', removeTime: 3, removeDialogue: true);
    } else {
      return const SizedBox.shrink();
    }
  }
}