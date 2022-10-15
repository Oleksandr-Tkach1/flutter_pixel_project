import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:flutter_pixel_project/ui/order_details/cubit/order_details_cubit.dart';
import 'package:flutter_pixel_project/ui/order_details/widget/order_list_image.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_svg/svg.dart';

class OrderPage extends StatefulWidget {
  final int index;
  final OrdersState state;
  final String orderId;

  const OrderPage(
      {Key? key,
      required this.index,
      required this.state,
      required this.orderId
      }) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late OrderDetailsCubit mainCubit;

  @override
  void initState() {
    mainCubit = BlocProvider.of<OrderDetailsCubit>(context);
    mainCubit.fetchOrderDetails(widget.orderId);
    super.initState();
  }

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
      ),
      body: const OrderListImage(),
    );
  }
}