import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/data/model/order_details/Images.dart';
import 'package:flutter_pixel_project/ui/order_details/cubit/order_details_state.dart';

import '../../../utils/form_validation.dart';

class RadioButton extends StatefulWidget {
  final OrderDetailsState state;
  final int index;
  final Images image;
  final TextEditingController controller;
  const RadioButton({Key? key, required this.state, required this.index, required this.image, required this.controller}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Row(
          children: <Widget>[
            Flexible(
              child: ListTile(
                title: const Text('Accept',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                leading: Radio<OrderStatus?>(
                  value: OrderStatus.accept,
                  groupValue: widget.image.status,
                  onChanged: (OrderStatus? status) {
                    setState(() {
                      widget.image.status = OrderStatus.accept;
                      widget.image.visibilityComment = false;
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
                  groupValue: widget.image.status,
                  onChanged: (OrderStatus? value) {
                    setState(() {
                      widget.image.status = OrderStatus.reject;
                      widget.image.visibilityComment = true;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          child: ListTile(
            title: const Text('Send to Customer',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            leading: Radio<OrderStatus?>(
              value: OrderStatus.sendToCustomer,
              groupValue: widget.image.status,
              onChanged: (OrderStatus? value) {
                  setState(() {
                    widget.image.status = OrderStatus.sendToCustomer;
                    widget.image.visibilityComment = true;
                });
              },
            ),
          ),
        ),
        Visibility(
          visible: widget.image.visibilityComment,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              maxLength: 20,
              style: const TextStyle(color: Colors.white),
              controller: widget.controller,
              validator: (value) => FormValidation.commentOrder(value!),
              decoration: const InputDecoration(
                  counterStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'Comment',
                  labelStyle: TextStyle(color: Colors.white),
                  enabled: true),
              autocorrect: false,
              textInputAction: TextInputAction.done,
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}