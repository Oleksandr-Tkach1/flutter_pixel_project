import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'authorization.dart';

class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColorLogin,
      body: AuthorizationWidget(),
    );
  }
}