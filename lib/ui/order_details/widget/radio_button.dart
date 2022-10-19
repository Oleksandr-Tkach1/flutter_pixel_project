import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/data/model/order_details/Images.dart';
import 'package:flutter_pixel_project/ui/order_details/cubit/order_details_state.dart';
class RadioButton extends StatefulWidget {
  final OrderDetailsState state;
  final int index;
  const RadioButton({Key? key, required this.state, required this.index}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: ListTile(
            title: const Text('Accept',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            leading: Radio<OrderStatus?>(
              value: OrderStatus.accept,
              groupValue: widget.state.orderDetails!.images![widget.index].status,
              onChanged: (OrderStatus? status) {
                setState(() {
                  widget.state.orderDetails!.images![widget.index].status = OrderStatus.accept;
                  widget.state.orderDetails!.images![widget.index].visibilityComment = false;
                });
              },
            ),
          ),
        ),
        Flexible(
          child: ListTile(
            title: const Text('Reject',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            leading: Radio<OrderStatus?>(
              value: OrderStatus.reject,
              groupValue: widget.state.orderDetails!.images![widget.index].status,
              onChanged: (OrderStatus? value) {
                setState(() {
                  widget.state.orderDetails!.images![widget.index].status = OrderStatus.reject;
                  widget.state.orderDetails!.images![widget.index].visibilityComment = true;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}