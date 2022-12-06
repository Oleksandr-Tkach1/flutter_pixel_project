import 'package:flutter/material.dart';

class DialogDetails extends StatelessWidget {
  final Color? color;
  final String? internetStatus;

  const DialogDetails({super.key, this.color, this.internetStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: color,
      child: Center(
          child: Text(internetStatus!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold))),
    );
  }
}