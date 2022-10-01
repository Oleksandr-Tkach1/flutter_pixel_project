import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_cubit.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';

class OrdersListWidget extends StatefulWidget {
  const OrdersListWidget({super.key});


  @override
  State<OrdersListWidget> createState() => _OrdersListWidgetState();
}

class _OrdersListWidgetState extends State<OrdersListWidget> {

  @override
  void initState() {
    // достаем последнний сохраненный статус и передаем в метод getOrders
    var currentStatus = BlocProvider.of<MainCubit>(context).currentStatus;
    BlocProvider.of<MainCubit>(context).getOrders(currentStatus);
    super.initState();
  }

  String getImageUrl(OrdersState state, int index) {
    var url = 'https://d15oaqjca840o0.cloudfront.net/orders/${state.loadedOrder![index].user!.sId!}/${state.loadedOrder![index].id!}/thumb/${state.loadedOrder![index].images![0].userImage!}';
    print(url);
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, OrdersState>(
      builder: (context, state) {
        if (state.status == OrdersStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if(state.status == OrdersStatus.listIsEmpty){
          return Center(child: Image.asset('assets/photo_2022-09-30_19-35-56.png'));
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              var currentStatus = BlocProvider.of<MainCubit>(context).currentStatus;
              BlocProvider.of<MainCubit>(context).getOrders(currentStatus);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: state.ordersCount,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 100,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: CustomColors.primaryBlack.shade300,
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5),
                              color: CustomColors.primaryBlack.shade300,
                            ),
                            child: Card(
                              color: CustomColors.primaryBlack.shade100,
                              child: Center(
                                child: ListTile(
                                  trailing: Image.network(getImageUrl(state, index), width: 100, height: 100,fit: BoxFit.cover),
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(state.loadedOrder?[index].orderId.toString() ?? '', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight. bold)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
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
}