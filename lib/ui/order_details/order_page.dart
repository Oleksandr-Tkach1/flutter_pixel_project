import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/order_details/cubit/order_details_cubit.dart';
import 'package:flutter_pixel_project/ui/order_details/cubit/order_details_state.dart';
import 'package:flutter_pixel_project/ui/order_details/widget/order_list_image.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_svg/svg.dart';

class OrderPage extends StatefulWidget {
  final String orderId;
  OrderDetailsState? state;

  OrderPage(
      {Key? key,
        this.state,
      required this.orderId,
      }) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late OrderDetailsCubit mainCubit;
  final ScrollController _controller = ScrollController();
  bool visibilityFloatingActionButton = false;

  @override
  void initState() {
    _controller.addListener(_onScroll);
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
      floatingActionButton:
      //buildFloatingActionButton(),
      FloatingActionButton(
        backgroundColor: AppColors.actionButtonColor,
          child: const Icon(Icons.arrow_downward, color: Colors.white,),
          onPressed: () {
            setState(() {
              //_messages.insert(0, Text("message ${_messages.length}"));
            });
            _controller.animateTo(
              0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
      ),
    );
  }

  void _onScroll() {
    if (_isTopPosition!) {
      visibilityFloatingActionButton = true;
    }
  }

  bool? get _isTopPosition {
    if (_controller.position.atEdge || _controller.position.pixels == 0) {
      return true;
      }
      return false;
    }
}