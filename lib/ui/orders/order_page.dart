import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/orders/cubit/order_cubit.dart';
import 'package:flutter_pixel_project/ui/orders/widget/orders_list.dart';
import 'package:flutter_pixel_project/ui/orders/widget/popup_menu.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_pixel_project/ui/main/widget/drawer_main.dart';
import 'package:flutter_svg/svg.dart';
import 'cubit/order_state.dart';

// ignore: must_be_immutable
class OrderPage extends StatefulWidget {
  String? currentStatus;

  OrderPage({
    super.key,
    this.currentStatus,
  });

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  late OrderCubit mainCubit;

  @override
  void initState() {
    mainCubit = BlocProvider.of<OrderCubit>(context);
    mainCubit.fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (BuildContext context, state) {
        if (widget.currentStatus != null &&
            widget.currentStatus != state.orderValidationStatus &&
            !mainCubit.fetching) {
          mainCubit.resetState(state.orderValidationStatus);
          mainCubit.fetchOrders();
        }
      },
      child: BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
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
          drawer: mainDrawer(),
        );
      }),
    );
  }
}