import 'package:flutter/material.dart';

bottomSheetDialog(BuildContext context, bool removeDialogue, String errorStatus) {
  return showBottomSheet(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.of(context).pop(removeDialogue);
        });
        return ListTile(
          minLeadingWidth: 15,
          tileColor: Colors.red,
          leading: const Icon(
            Icons.error,
            color: Color(0xFFFFB5B5),
          ),
          title: Text(errorStatus,
              style: const TextStyle(color: Color(0xFFFFB5B5), fontWeight: FontWeight.bold)),
        );
      });
}