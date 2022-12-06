import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_event.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_state.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/main.dart';
import '../../ui/authorization_page/authorization/cubit/authorization_cubit.dart';
import '../../utils/dialog.dart';

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
          token: '',
          ));
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

  checkInternetConnection(ConnectivityResult result){
    if(result == ConnectivityResult.none){
      emit(state.copyWith(
        internetConnection: InternetConnection.notConnect
      ));
    }else{
      emit(state.copyWith(
          internetConnection: InternetConnection.connect
      ));
    }
  //   final hasInternet = result != ConnectivityResult.none;
  //   final message = hasInternet ? 'You have again ${result.toString()}' : 'You have not internet';
  //   //final color = hasInternet ? Colors.green : Colors.red;
  //   bottomSheetDialog(context, false, message);
  }
}