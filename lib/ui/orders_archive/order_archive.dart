import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/orders_archive/cubit/orders_archive_cubit.dart';
import 'package:flutter_pixel_project/ui/orders_archive/cubit/orders_archive_state.dart';
import 'package:flutter_pixel_project/ui/orders_archive/widget/orders_list_archive.dart';
import 'package:flutter_pixel_project/ui/orders_archive/widget/popup_menu.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class OrderArchive extends StatefulWidget {
  String? currentStatus;

  OrderArchive({super.key, this.currentStatus,});

  @override
  OrderArchiveState createState() => OrderArchiveState();
}

class OrderArchiveState extends State<OrderArchive> {
  late OrdersArchiveCubit ordersArchiveCubit;

  @override
  void initState() {
    ordersArchiveCubit = BlocProvider.of<OrdersArchiveCubit>(context);
    ordersArchiveCubit.fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersArchiveCubit, OrdersArchiveState>(
      listener: (BuildContext context, state) {
        if (widget.currentStatus != null && !ordersArchiveCubit.fetching) {
          ordersArchiveCubit.fetchOrders();
        }
      },
      child: BlocBuilder<OrdersArchiveCubit, OrdersArchiveState>(builder: (context, state) {
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
          body: OrdersListArchive(status: widget.currentStatus),
        );
      }),
    );
  }
}