import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/order_details/cubit/order_details_cubit.dart';
import 'package:flutter_pixel_project/ui/order_details/cubit/order_details_state.dart';
import 'package:photo_view/photo_view.dart';

enum SingingCharacter { accept, reject, none }

class OrderListImage extends StatefulWidget {
  const OrderListImage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderListImage> createState() => _OrderListImageState();
}

class _OrderListImageState extends State<OrderListImage> {
  final _scrollController = ScrollController();
  SingingCharacter? _character = SingingCharacter.none;
  bool bottomButtonList = false;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
      if (state.status == Status.loading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.separated(
            controller: _scrollController,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            scrollDirection: Axis.vertical,
            itemCount: state.orderDetails!.images!.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 2,
                      child: Card(
                        color: Colors.white,
                        child: PhotoView(
                          backgroundDecoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          imageProvider: CachedNetworkImageProvider(
                            getLeftImageOrderUrl(state, index),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 2,
                      child: Card(
                        color: Colors.white,
                        child: PhotoView(
                          backgroundDecoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          imageProvider: CachedNetworkImageProvider(
                            getRightImageOrder(state, index),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: ListTile(
                            title: const Text('Accept',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.accept,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
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
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.reject,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    //_displayButton(),
                  ],
                );
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

  _onScroll() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      print('The list has reached the end');
      return bottomButtonList = true;
    }else{
      return bottomButtonList = false;
    }
  }
}