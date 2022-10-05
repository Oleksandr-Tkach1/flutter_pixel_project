import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_bloc.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_cubit.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:flutter_pixel_project/ui/main/widget/orders_list.dart';
import 'package:flutter_pixel_project/ui/main/widget/popup_menu.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  String? currentStatus;

  MainPage({super.key, this.currentStatus});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  late final VoidCallback? onActionClick0;
  late AuthenticationBloc authenticationBloc;
  late MainCubit mainCubit;

  @override
  void initState() {
    mainCubit = BlocProvider.of<MainCubit>(context);
    mainCubit.getOrders('PEDNING_APPROVAL');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      timerRefreshOrder();
    });
    return BlocListener<MainCubit, OrdersState>(
      listener: (BuildContext context, state) {
        if (widget.currentStatus != null &&
            widget.currentStatus != state.orderValidationStatus) {
          BlocProvider.of<MainCubit>(context)
              .getOrders(state.orderValidationStatus);
        }
      },
      child: BlocBuilder<MainCubit, OrdersState>(builder: (context, state) {
        widget.currentStatus = state.orderValidationStatus;
        return Scaffold(
          backgroundColor: CustomColors.primaryBlack.shade50,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            centerTitle: true,
            backgroundColor: CustomColors.primaryBlack.shade50,
            elevation: 0,
            title: SvgPicture.asset('assets/gad_logo.svg', width: 110),
            actions: <Widget>[
              popupMenu(context, state),
            ],
          ),
          body: OrdersListWidget(status: widget.currentStatus),
        );
      }),
    );
  }

  timerRefreshOrder() {
    Timer.periodic(const Duration(seconds: 60), (timer) {
      // достаем последнний сохраненный статус и передаем в метод getOrders
      //var currentStatus = BlocProvider.of<MainCubit>(context).currentStatus;
      mainCubit.getOrders(widget.currentStatus!);
    });
  }

  @override
  void dispose() {
    timerRefreshOrder().dispose();
    super.dispose();
  }
}
