import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_cubit.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_pixel_project/utils/bottom_loader.dart';

// ignore: must_be_immutable
class OrdersListWidget extends StatefulWidget {
  String? status;

  OrdersListWidget({super.key, this.status});

  @override
  State<OrdersListWidget> createState() => _OrdersListWidgetState();
}

class _OrdersListWidgetState extends State<OrdersListWidget> {
  final _scrollController = ScrollController();
  late MainCubit? _cubit;
  String getImageUrl(OrdersState state, int index) {
    return 'https://d15oaqjca840o0.cloudfront.net/orders/${state.loadedOrder[index].user!.sId!}/${state.loadedOrder[index].id!}/thumb/${state.loadedOrder[index].images![0].userImage!}';
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _cubit = BlocProvider.of<MainCubit>(context);
    _cubit!.fetchActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, OrdersState>(
        listener: (context, state){
          if(!state.hasReachedMax && _isBottom){
            _cubit!.fetchActivities();
          }
    },builder: (context, state) {
        if (state.status == OrdersStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == OrdersStatus.listIsEmpty) {
          return Center(
              child: Image.asset('assets/photo_2022-09-30_19-35-56.png'));
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<MainCubit>(context)
                  .getOrders(0, state.orderValidationStatus);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: state.hasReachedMax
                            ? state.ordersCount
                            : state.ordersCount + 1,
                        controller: _scrollController,
                        itemBuilder: (BuildContext context, int index) {
                          return index >= state.ordersCount
                              ? state.ordersCount > 6  ? const BottomLoader() : const SizedBox()
                              : Container(
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
                                        getImageUrl(state, index),
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover),
                                  ),
                                  leading: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          state.loadedOrder[index].orderId.toString() ?? '',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Container(width: 12, height: 12, child: setCurrentStatus(state, index)
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
  void _onScroll() {
    if (_isBottom) {
      _cubit!.fetchActivities();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) {
      return false;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  setCurrentStatus(OrdersState state, dynamic index){
    if(widget.status == 'PEDNING_APPROVAL'){
      return
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: state.loadedOrder[index]
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