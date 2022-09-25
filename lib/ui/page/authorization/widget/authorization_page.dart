import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/ui/page/authorization/widget/authorization.dart';

class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: AuthorizationWidget(),
    );
  }
}