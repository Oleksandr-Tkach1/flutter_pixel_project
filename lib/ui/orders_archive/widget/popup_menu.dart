import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_event.dart';
import 'package:flutter_pixel_project/ui/orders_archive/cubit/orders_archive_state.dart';


enum Menu {
  Logout,
}

Widget popupMenu(BuildContext context, OrdersArchiveState state) {
  return PopupMenuButton<Menu>(
    itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
      PopupMenuItem<Menu>(
        onTap: () => BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut()),
        value: Menu.Logout,
        child: const Text('Logout'),
      ),
    ],
  );
}