import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/Order.dart';
import 'package:flutter_pixel_project/ui/orders_archive/cubit/orders_archive_state.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';

class OrderItemArchive extends StatefulWidget {
  final Order order;
  final int index;
  final OrdersArchiveState state;

  OrderItemArchive({Key? key, required this.order, required this.index, required this.state}) : super(key: key);

  @override
  State<OrderItemArchive> createState() => _OrderItemArchiveState();
}

class _OrderItemArchiveState extends State<OrderItemArchive> {
  String _getImageUrl(OrdersArchiveState state, int index) {
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
              height: 100, width: 100,
              child: CachedNetworkImage(
                imageUrl: _getImageUrl(widget.state, widget.index),
                  errorWidget: (context, url, error) => const Icon(Icons.error_outline, size: 30, color: Color(0xFFE92020),),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
              ),
            ),
            // onTap: () {
            //   Navigator.of(context).push(PageRouteBuilder(opaque: false,
            //       pageBuilder: (context, _, __) =>
            //           _showDialog(widget.state, widget.index, widget.status)));
            // },
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.state.loadedOrders[widget.index].orderId.toString() ?? '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}