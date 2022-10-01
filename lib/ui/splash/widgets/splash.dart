import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_event.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_svg/svg.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    startNavigateWithDelay();
  }

  startNavigateWithDelay() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      BlocProvider.of<AuthenticationBloc>(context).add(AppLoaded());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: AppColors.backgroundColorLogin,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Center(
                  child: SvgPicture.asset('assets/gad_logo.svg', width: 180),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    ));
  }
}