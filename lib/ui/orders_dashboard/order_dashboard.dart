import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/orders_dashboard/cubit/orders_dashboard_cubit.dart';
import 'package:flutter_pixel_project/ui/orders_dashboard/cubit/orders_dashboard_state.dart';
import 'package:flutter_pixel_project/ui/orders_dashboard/widget/orders_list_dashboard.dart';
import 'package:flutter_pixel_project/ui/orders_dashboard/widget/popup_menu.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class OrderDashboard extends StatefulWidget {
  String? currentStatus;

  OrderDashboard({super.key, this.currentStatus,});

  @override
  OrderDashboardState createState() => OrderDashboardState();
}

class OrderDashboardState extends State<OrderDashboard> {
  late OrdersDashboardCubit ordersDashboardCubit;

  @override
  void initState() {
    ordersDashboardCubit = BlocProvider.of<OrdersDashboardCubit>(context);
    ordersDashboardCubit.fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersDashboardCubit, OrdersDashboardState>(
      listener: (BuildContext context, state) {
        if (widget.currentStatus != null && !ordersDashboardCubit.fetching) {
          ordersDashboardCubit.fetchOrders();
        }
      },
      child: BlocBuilder<OrdersDashboardCubit, OrdersDashboardState>(builder: (context, state) {
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
          body: OrdersListDashboard(status: widget.currentStatus),
        );
      }),
    );
  }
}