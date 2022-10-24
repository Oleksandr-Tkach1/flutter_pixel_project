import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_svg/svg.dart';

Widget mainDrawer(){
  return Drawer(
    backgroundColor: AppColors.backgroundColor,
    child: ListView(
      children: <Widget>[
        Container(
          color: AppColors.backgroundColor,
          child: DrawerHeader(
            // margin: EdgeInsets.zero,
            // padding: EdgeInsets.zero,
            child: SvgPicture.asset('assets/logo.a7fc1d91.svg'),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              minLeadingWidth: 20,
              contentPadding: const EdgeInsets.only(left: 10),
              title: const Text(
                "Dashboard",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.image, color: Colors.white, size: 28),
              onTap: () => '',
            ),
            ListTile(
              minLeadingWidth: 20,
              contentPadding: const EdgeInsets.only(left: 10),
              title: const Text(
                "Orders",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.camera_alt, color: Colors.white, size: 28),
              onTap: () => '',
            ),
            ListTile(
              minLeadingWidth: 20,
              title: const Text(
                "Archived",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.storage, color: Colors.white, size: 28),
              contentPadding: const EdgeInsets.only(left: 10),
              onTap: () => '',
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 150),
            //   child: Align(
            //     alignment: FractionalOffset.bottomCenter,
            //     child: Column(
            //       children: [
            //           Container(
            //             width: 230,
            //             height: 110,
            //             child: IconButton(
            //                 onPressed: () => '',
            //                 icon: SvgPicture.asset('assets/google.svg', width: 100, height: 100,)
            //             ),
            //           ),
            //           Container(
            //             width: 230,
            //             height: 110,
            //             child: IconButton(
            //                 onPressed: () => '',
            //                 icon: SvgPicture.asset('assets/apple.svg', width: 100, height: 100,)
            //             ),
            //           ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    ),
  );
}