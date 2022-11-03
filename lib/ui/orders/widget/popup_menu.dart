import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_event.dart';
import '../cubit/main_cubit.dart';
import '../cubit/main_state.dart';

enum Menu {
  PEDNING,
  CORRECTION,
  REJECT,
  Logout,
}

Widget popupMenu(BuildContext context, OrdersState state) {
  return PopupMenuButton<Menu>(
    itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
      PopupMenuItem<Menu>(
        onTap: () async{
          var status = "PEDNING_APPROVAL";
          setOrderStatus(status, context, state);
        },
        value: Menu.PEDNING,
        child: const Text('PENDING'),
      ),
      PopupMenuItem<Menu>(
        onTap: () async{
          var status = "CORRECTION_NEEDED";
          setOrderStatus(status, context, state);
        },
        value: Menu.CORRECTION,
        child: const Text('CORRECTION'),
      ),
      PopupMenuItem<Menu>(
        onTap: () async{
          var status = "REJECTED";
          setOrderStatus(status, context, state);
        },
        value: Menu.REJECT,
        child: const Text('REJECT'),
      ),
      PopupMenuItem<Menu>(
        onTap: () => BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut()),
        value: Menu.Logout,
        child: const Text('Logout'),
      ),
    ],
  );
}

void setOrderStatus(String status, BuildContext context, OrdersState state){
  BlocProvider.of<MainCubit>(context).setCurrentStatus(status);
}