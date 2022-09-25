import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/ui/main/widget/orders_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OrdersListWidget(),
    );
  }
}