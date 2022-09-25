import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/repositories/auth_repositories.dart';
import 'package:flutter_pixel_project/ui/page/authorization/cubit/authorization_state.dart';
import 'package:dio/dio.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  final AuthRepository _loginRepository;

  AuthorizationCubit(this._loginRepository) : super(const AuthorizationState());

  ///
  authenticate(String email, String password) {
    emit(state.copyWith(status: AuthorizationStatus.loading));
    _loginRepository.authenticate(email, password).whenComplete(() {
      emit(state.copyWith(status: AuthorizationStatus.complete));
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final response = (obj as DioError).response;
          emit(state.copyWith(
              status: AuthorizationStatus.error,
              errorMessage:
                  'Something went wrong, please try later $response'));
      }
    });
  }

  void clearState() {
    emit(state.copyWith(
      email: '',
      confirmCode: '',
      status: AuthorizationStatus.initial,
    ));
  }
}
