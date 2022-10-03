import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_event.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_cubit.dart';
import 'package:flutter_pixel_project/ui/main/widget/orders_list.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_svg/svg.dart';

enum Menu {
  PEDNING,
  CORRECTION,
  REJECT,
  Logout,
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final VoidCallback? onActionClick0;
  late AuthenticationBloc authenticationBloc;

  timerRefreshOrder(){
    // Timer.periodic(const Duration(seconds: 25), (timer) {
    //   // достаем последнний сохраненный статус и передаем в метод getOrders
    //   var currentStatus = BlocProvider.of<MainCubit>(context).currentStatus;
    //   BlocProvider.of<MainCubit>(context).getOrders(currentStatus);
    // });
  }

  @override
  Widget build(BuildContext context) {

    setState(() {
      timerRefreshOrder();
    });

    return Scaffold(
      backgroundColor: CustomColors.primaryBlack.shade50,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: CustomColors.primaryBlack.shade50,
        elevation: 0,
        title: SvgPicture.asset('assets/gad_logo.svg', width: 110),
        actions: <Widget>[
          PopupMenuButton<Menu>(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              PopupMenuItem<Menu>(
                onTap: () {
                  var status = "PEDNING_APPROVAL";
                  BlocProvider.of<MainCubit>(context).setCurrentStatus(status);
                  BlocProvider.of<MainCubit>(context).getOrders(status);
                },
                value: Menu.PEDNING,
                child: const Text('PENDING'),
              ),
              PopupMenuItem<Menu>(
                onTap: () {
                  var status = "CORRECTION_NEEDED";
                  BlocProvider.of<MainCubit>(context).setCurrentStatus(status);
                  BlocProvider.of<MainCubit>(context).getOrders(status);
                },
                value: Menu.CORRECTION,
                child: const Text('CORRECTION'),
              ),
              PopupMenuItem<Menu>(
                onTap: () {
                  var status = "REJECTED";
                  BlocProvider.of<MainCubit>(context).setCurrentStatus(status);
                  BlocProvider.of<MainCubit>(context).getOrders(status);
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
          ),
        ],
      ),
      body: const OrdersListWidget(),
    );
  }
  @override
  void dispose() {
    timerRefreshOrder().dispose();
    super.dispose();
  }
}