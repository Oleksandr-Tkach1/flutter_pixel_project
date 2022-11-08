import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/ui/orders_dashboard/main_orders_dashboard.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_svg/svg.dart';
import '../ui/orders/main_page.dart';
import '../ui/orders_archive/main_orders_archive.dart';

List<String> _titleList = [
  "Dashboard",
  "Orders",
  "Archived",
];
List<Icon> _leadingList = [
  const Icon(Icons.image, color: Colors.white, size: 28),
  const Icon(Icons.camera_alt, color: Colors.white, size: 28),
  const Icon(Icons.storage, color: Colors.white, size: 28),
];

int updateCountList = 1;

int currentItem = 1;

Widget mainDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: AppColors.backgroundColor,
    child: Column(
      children: [
        Container(
          color: AppColors.backgroundColor,
          child: DrawerHeader(
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SvgPicture.asset(
              'assets/logo.a7fc1d91.svg',
              width: 100,
              height: 100,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 12),
          child: Divider(
            color: Color(0xFF757575),
            height: 3,
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: _titleList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: _updateSelectedItem(index),
                minLeadingWidth: 20,
                contentPadding: const EdgeInsets.only(left: 10),
                title: Text(_titleList[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                leading: _leadingList[index],
                onTap: () {
                  updateCountList = index;
                  _sendNavigator(context, index);
                  currentItem = updateCountList;
                  // Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}

 _updateSelectedItem(int index) {
   if(index == updateCountList){
     return const Color(0xFF4A5062);
   }else{
     return null;
   }
}

 _sendNavigator(BuildContext context, int index){
  if(currentItem == updateCountList){
    return Navigator.pop(context);
  }else
    if(updateCountList == 0){
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                MainOrdersDashboard()));
  }else if(updateCountList == 1){
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
            MainPage()));
  }else if(updateCountList == 2){
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
            MainOrdersArchive()));
  }
 }