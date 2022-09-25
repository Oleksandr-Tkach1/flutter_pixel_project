import 'package:flutter_pixel_project/bloc/auth/auth_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_event.dart';
import 'package:flutter_pixel_project/data/repositories/auth_repositories.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/network/server_api.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_cubit.dart';
import 'package:flutter_pixel_project/ui/page/authorization/cubit/authorization_cubit.dart';

getRepositories(RestClient client) {
  return [
    RepositoryProvider<UserRepository>(create: (context) => UserRepository(client)),
    RepositoryProvider<AuthRepository>(create: (context) => AuthRepository(client)),
  ];
}

getProviders(RestClient client) {
  return [
    BlocProvider(create: (context) => MainCubit(UserRepository(client))),
    BlocProvider(create: (context) => AuthorizationCubit(AuthRepository(client))),
    BlocProvider(create: (context) => AuthenticationBloc(UserRepository(client))..add(AppStarted())),
    // BlocProvider(create: (context) => MainCubit()),
    // BlocProvider(create: (context) => SplashCubit()),
  ];
}