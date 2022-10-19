import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/order_details/cubit/order_details_cubit.dart';
import 'package:flutter_pixel_project/ui/order_details/cubit/order_details_state.dart';
import 'package:flutter_pixel_project/ui/order_details/widget/radio_button.dart';
import 'package:flutter_pixel_project/utils/form_validation.dart';
import 'package:photo_view/photo_view.dart';

class OrderListImage extends StatefulWidget {
  const OrderListImage({Key? key}) : super(key: key);

  @override
  State<OrderListImage> createState() => _OrderListImageState();
}

class _OrderListImageState extends State<OrderListImage> {
  final _commentTextController = TextEditingController();

  ///Test
  String baseUrlImage = 'https://dailystorm.ru/media/images/2020/09/29/843a1336-4b8d-412c-a97d-d1369d440730.jpg';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
      if (state.status == Status.loading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            scrollDirection: Axis.vertical,
            itemCount: state.orderDetails!.images!.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == state.orderDetails!.images!.length - 1) {
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
                    child: const Text('Accept', style: TextStyle(color: Colors.white, fontSize: 21)),
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
                          imageProvider: CachedNetworkImageProvider(
                              baseUrlImage
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
                          imageProvider: CachedNetworkImageProvider(
                              baseUrlImage
                              //getRightImageOrder(state, index),
                              ),
                        ),
                      ),
                    ),
                    buildRadioButton(state, index),
                    Visibility(
                      visible: state.orderDetails!.images![index].visibilityComment,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          maxLength: 20,
                          style: const TextStyle(color: Colors.white),
                          controller: _commentTextController,
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
            });
      }
    });
  }

  String getLeftImageOrderUrl(OrderDetailsState state, int index) {
    return 'https://d15oaqjca840o0.cloudfront.net/orders/${state.orderDetails?.user}/${state.orderDetails?.id!}/${state.orderDetails?.images![index].userImage!}';
  }

  String getRightImageOrder(OrderDetailsState state, int index) {
    return 'https://d15oaqjca840o0.cloudfront.net/orders/${state.orderDetails?.user}/${state.orderDetails?.id!}/${state.orderDetails?.images![index].aiCompositedImage!}';
  }

  buildRadioButton(OrderDetailsState state, int index){
    if(state.orderDetails!.status == 'REJECTED'){
    //if(state.orderDetails!.status == 'PEDNING_APPROVAL'){
      return RadioButton(state: state, index: index);
    }else{
      return Container();
    }
  }

  // buildBottomButton(OrderDetailsState state, int index){
  //   if(state.orderDetails!.images![index].status.index.f){
  //     return Padding(
  //       padding: const EdgeInsets.only(bottom: 25, left: 55, right: 55),
  //       child: ElevatedButton(
  //         style: ElevatedButton.styleFrom(
  //           minimumSize: const Size(500, 56),
  //           backgroundColor: Colors.green,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(20.0),
  //           ),
  //         ),
  //         onPressed: () => '',
  //         child: const Text('Accept', style: TextStyle(color: Colors.white, fontSize: 21)),
  //       ),
  //     );
  //   }else {
  //     return Container();
  //   }
  // }
}