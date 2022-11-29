import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/ui/orders/order_page.dart';
import 'package:flutter_pixel_project/ui/orders_archive/order_archive.dart';
import 'package:flutter_pixel_project/ui/orders_dashboard/order_dashboard.dart';

enum TabItem { dashboard, orders, archive }
Map<TabItem, Widget> navigationTabPages = {
  TabItem.dashboard: OrderDashboard(),
  TabItem.orders: OrderPage(),
  TabItem.archive: OrderArchive()};