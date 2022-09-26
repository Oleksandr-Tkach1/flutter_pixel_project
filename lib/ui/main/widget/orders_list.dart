import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_cubit.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';

class OrdersListWidget extends StatefulWidget {
  const OrdersListWidget({super.key});


  @override
  State<OrdersListWidget> createState() => _OrdersListWidgetState();
}

class _OrdersListWidgetState extends State<OrdersListWidget> {

  @override
  void initState() {
    BlocProvider.of<MainCubit>(context).getOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, OrdersState>(
        builder: (context, state) {
          if (state.status == OrdersStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(state.ordersCount.toString(),
                        style: const TextStyle(fontSize: 48))),
                ElevatedButton(onPressed: () =>
                    BlocProvider.of<MainCubit>(context).getOrders(), child: const Icon(Icons.settings_backup_restore))
              ],
            );
          }
        },
    );

    // return ListView.builder(
    //     padding: const EdgeInsets.all(8),
    //     itemCount: orders.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Container(
    //         height: 100,
    //         color: Colors.amber[colorCodes[index]],
    //         child: Column(
    //           children: [
    //             Center(child: Text('Entry ${orders[index]}')),
    //             const SizedBox(height: 80,),
    //           ],
    //         ),
    //       );
    //     }
    // );
  }
}