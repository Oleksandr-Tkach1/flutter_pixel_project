import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_cubit.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:flutter_pixel_project/ui/main/widget/drawer_main.dart';
import 'package:flutter_pixel_project/ui/main/widget/navigation_tab_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TabItem _currentTab = TabItem.orders;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(builder: (context, state) {
      return WillPopScope(
        //onWillPop: () async => onBack(),
        onWillPop: () async => true,
        child: Scaffold(
          body: Stack(children: <Widget>[
            _buildOffstageNavigator(TabItem.dashboard),
            _buildOffstageNavigator(TabItem.orders),
            _buildOffstageNavigator(TabItem.archive),
          ]),
          drawer: mainDrawer(context, state),
          ),
      );
    });
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: Navigator(
        //key: _navigatorKeys[tabItem],
        initialRoute: '/',
        // onGenerateRoute: (routeSettings) {
        //   return MaterialPageRoute(
        //     builder: (context) => navigationTabPages[tabItem],
        //   );
        // },
      ),
    );
  }
}