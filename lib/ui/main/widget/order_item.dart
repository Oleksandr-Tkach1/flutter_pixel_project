import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/Order.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:flutter_pixel_project/ui/order_details/order_page.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
class OrderItem extends StatefulWidget {
  final Order order;
  final int index;
  String status;
  final OrdersState state;

  OrderItem({Key? key, required this.order, required this.index, required this.status, required this.state}) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  String getImageUrl(OrdersState state, int index) {
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
              child: Image.network(
                  getImageUrl(widget.state, widget.index),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderPage(
              index: widget.index,
              state: widget.state,
              orderId: widget.state.loadedOrders[widget.index].id.toString(),))),
            leading: Column(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(widget.state.loadedOrders[widget.index].orderId.toString() ?? '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Container(width: 12, height: 12, child: setCurrentStatus(widget.state, widget.index, widget.status)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  setCurrentStatus(OrdersState state, dynamic index, String status){
    if(status == 'PEDNING_APPROVAL'){
      return
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: state.loadedOrders[index]
                .qaDetails!.startTime != null
                ? Colors.red
                : Colors.green,
            shape: BoxShape.circle,
          ),
        );
    }else{
      return
        Container();
    }
  }
}