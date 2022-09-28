import 'package:flutter_pixel_project/bloc/auth/auth_event.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_state.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/main.dart';
import 'package:flutter_pixel_project/ui/page/authorization/cubit/authorization_cubit.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc(this._userRepository) : super(const AuthenticationState(status: AuthenticationStatus.uninitialized)){
    on<AppStarted>((event, emit) async{
      emit(state.copyWith(status: AuthenticationStatus.loading));
    });
    on<AppLoaded>((event, emit) async{
      final String? accessToken = await _userRepository.getAccessToken();
      if (accessToken != null && accessToken.isNotEmpty) {
        emit(state.copyWith(status: AuthenticationStatus.authenticated, token: accessToken));
      } else {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated, token: ''));
      }
    });
    on<LoggedOut>((event, emit) async{
      clearAppData(MainAppState.getContext());
      emit(state.copyWith(
          status: AuthenticationStatus.unauthenticated,
          deepLinkConfirmCode: '',
          deepLinkEmail: '',
          token: '',
          ),
      );
    });
    on<LoggedIn>((event, emit) async{
      emit(state.copyWith(
          status: AuthenticationStatus.authenticated,
          ));
    });
  }

  void clearAppData(BuildContext context) {
    _userRepository.removeAccessData();

    BlocProvider.of<AuthorizationCubit>(context).clearState();
    // clear other states here if needed
  }

  void logout(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
  }
}