import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/ui/order_details/cubit/order_details_state.dart';
import 'package:flutter_pixel_project/ui/order_details/widget/radio_button.dart';
import 'package:photo_view/photo_view.dart';

class OrderListImage extends StatefulWidget {
  OrderDetailsState state;

  OrderListImage({Key? key, required this.state}) : super(key: key);

  @override
  State<OrderListImage> createState() => _OrderListImageState();
}

class _OrderListImageState extends State<OrderListImage> {
  final _commentTextController = TextEditingController();

  ///Test
  String baseUrlImage =
      'https://dailystorm.ru/media/images/2020/09/29/843a1336-4b8d-412c-a97d-d1369d440730.jpg';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.state.images!.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == widget.state.images!.length - 1) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 25, left: 55, right: 55),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 56),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () => '',
                child: const Text('Accept',
                    style: TextStyle(color: Colors.white, fontSize: 21)),
              ),
            );
          } else {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Card(
                    color: Colors.white,
                    child: PhotoView(
                      backgroundDecoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      imageProvider: CachedNetworkImageProvider(baseUrlImage
                          //getLeftImageOrderUrl(state, index),
                          ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Card(
                    color: Colors.white,
                    child: PhotoView(
                      backgroundDecoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      imageProvider: CachedNetworkImageProvider(baseUrlImage
                          //getRightImageOrder(state, index),
                          ),
                    ),
                  ),
                ),
                buildRadioButton(widget.state, index),
              ],
            );
          }
        });
  }

  String getLeftImageOrderUrl(OrderDetailsState state, int index) {
    return 'https://d15oaqjca840o0.cloudfront.net/orders/${state.orderDetails?.user}/${state.orderDetails?.id!}/${state.images![index].userImage!}';
  }

  String getRightImageOrder(OrderDetailsState state, int index) {
    return 'https://d15oaqjca840o0.cloudfront.net/orders/${state.orderDetails?.user}/${state.orderDetails?.id!}/${state.images![index].aiCompositedImage!}';
  }

  buildRadioButton(OrderDetailsState state, int index) {
    if (state.orderDetails!.status == 'REJECTED') {
      //if(state.orderDetails!.status == 'PEDNING_APPROVAL'){
      return RadioButton(
        state: state,
        index: index,
        controller: _commentTextController,
      );
    } else {
      return Container();
    }
  }

  buildFloatingActionButton(Function function, OrderDetailsState state) {
    return FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_downward),
        onPressed: () {
          function();
        });
  }
}
