import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_cubit.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:flutter_pixel_project/ui/main/widget/order_item.dart';
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
          if (!state.hasReachedMax && _isBottom) {
            _cubit!.fetchActivities();
          }
    },builder: (context, state) {
        if (state.status == OrdersStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == OrdersStatus.listIsEmpty) {
          return Center(child: Image.asset('assets/photo_2022-09-30_19-35-56.png'));
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<MainCubit>(context).getOrders(1, state.orderValidationStatus);
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
                        itemBuilder: (BuildContext context, int index) {
                          return index >= state.ordersCount
                              ? state.ordersCount >= 10
                              ? const BottomLoader()
                              : const SizedBox()
                              : OrderItem(state: state,
                            order: state.loadedOrder[index],
                            index: index,
                            status: widget.status,
                          );
                        },
                      itemCount: state.hasReachedMax
                          ? state.ordersCount
                          : state.ordersCount + 10,
                      controller: _scrollController,
                        ),
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
}