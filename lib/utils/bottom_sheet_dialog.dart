import 'package:flutter/material.dart';
import '../ui/authorization_page/authorization/cubit/authorization_state.dart';

bottomSheetDialog(BuildContext context, AuthorizationState state) {
  return showBottomSheet(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.of(context).pop(true);
        });
        return ListTile(
          minLeadingWidth: 15,
          tileColor: Colors.red,
          leading: const Icon(
            Icons.error,
            color: Color(0xFFFFB5B5),
          ),
          title: Text(state.statusError,
              style: const TextStyle(color: Color(0xFFFFB5B5), fontWeight: FontWeight.bold)),
        );
      });
}