import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_state.dart';
import 'package:flutter_pixel_project/network/server_api.dart';
import 'package:flutter_pixel_project/providers/providers.dart';
import 'package:flutter_pixel_project/ui/main/main_page.dart';
import 'package:flutter_pixel_project/ui/page/authorization/widget/authorization_page.dart';
import 'package:flutter_pixel_project/ui/splash/splash_page.dart';

void main() {
  final RestClient client = RestClient(baseUrl: 'https://gad24.tools/api');
  runApp(MultiRepositoryProvider(
    providers: getRepositories(client),
    child: MultiBlocProvider(
        providers: getProviders(client), child: const MainApp()),
  ));
}

class MainApp extends StatefulWidget {
  static BuildContext? _context;

  const MainApp({Key? key}) : super(key: key);

  static BuildContext getContext() {
    return _context!;
  }

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: navigateToHomeWidget(state),
        );
    });
  }

  Widget navigateToHomeWidget(AuthenticationState state) {
    switch (state.status) {
      case AuthenticationStatus.loading:
        return const SplashPage();
      case AuthenticationStatus.authenticated:
        return const MainPage();
      case AuthenticationStatus.unauthenticated:
        return const AuthorizationPage();
      default: return const AuthorizationPage();
    }
  }
}
