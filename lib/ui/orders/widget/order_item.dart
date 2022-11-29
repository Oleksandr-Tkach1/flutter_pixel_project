import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/Order.dart';
import 'package:flutter_pixel_project/ui/order_details/order_page.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import '../cubit/order_state.dart';

class OrderItem extends StatefulWidget {
  final Order order;
  final int index;
  String status;
  final OrderState state;

  OrderItem(
      {Key? key,
      required this.order,
      required this.index,
      required this.status,
      required this.state})
      : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  String _getImageUrl(OrderState state, int index) {
    return 'https://d15oaqjca840o0.cloudfront.net/orders/${state.loadedOrders[index].user!.sId!}/${state.loadedOrders[index].id!}/thumb/${state.loadedOrders[index].images![0].userImage!}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: CustomColors.primaryBlack.shade300,
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.primaryBlack.shade300,
      ),
      child: Card(
        color: CustomColors.primaryBlack.shade100,
        child: Center(
          child: ListTile(
            trailing: SizedBox(
              height: 100,
              width: 100,
              child: CachedNetworkImage(
                imageUrl: _getImageUrl(widget.state, widget.index),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error_outline,
                  size: 30,
                  color: Color(0xFFE92020),
                ),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (context, _, __) => _showDialog(widget.state, widget.index, widget.status)));
            },
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.state.loadedOrders[widget.index].orderId.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 12,
                  height: 12,
                  child: setCurrentStatus(widget.state, widget.index, widget.status),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  setCurrentStatus(OrderState state, int index, String status) {
    if (status == 'PEDNING_APPROVAL') {
      return Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: checkingOrderStatus(state, index),
          shape: BoxShape.circle,
        ),
      );
    } else {
      return Container();
    }
  }

  _showDialog(OrderState state, int index, String status) {
    if (state.loadedOrders[index].qaDetails?.qa?.sId ==
        '6058d2143e1ffd3614dcf56f') {
      return OrderPage(
        orderId: state.loadedOrders[index].id.toString(),
      );
    } else if (status == 'PEDNING_APPROVAL' &&
        state.loadedOrders[index].qaDetails!.startTime != null) {
      return AlertDialog(
        backgroundColor: AppColors.alertDialogColor,
        title:
            const Text('Order is busy!', style: TextStyle(color: Colors.white)),
        content: const Text('Another qa has already taken this order',
            style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK',
                style: TextStyle(color: AppColors.acceptTextColor)),
          ),
        ],
      );
    } else {
      return OrderPage(orderId: state.loadedOrders[index].id.toString());
    }
  }

  checkingOrderStatus(OrderState state, int index) {
    if (state.loadedOrders[index].qaDetails!.startTime == null) {
      return Colors.green;
    } else if (state.loadedOrders[index].qaDetails?.qa?.sId ==
        '6058d2143e1ffd3614dcf56f') {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}