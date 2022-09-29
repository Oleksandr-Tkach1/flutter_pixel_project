import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_event.dart';
import 'package:flutter_pixel_project/ui/main/widget/orders_list.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final VoidCallback? onActionClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryBlack.shade50,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: CustomColors.primaryBlack.shade50,
        elevation: 0,
        title: SvgPicture.asset('assets/gad_logo.svg', width: 110),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (_) => BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut()),
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Assigned'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: const OrdersListWidget(),
    );
  }
}