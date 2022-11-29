import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/repositories/auth_repositories.dart';
import 'package:dio/dio.dart';
import '../../../../data/app_data.dart';
import 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  final AuthRepository _loginRepository;
  AuthorizationCubit(this._loginRepository) : super(const AuthorizationState());

  authenticate(String email, String password) {
    emit(state.copyWith(status: AuthorizationStatus.loading, alertStatus: AlertStatus.none));
    return _loginRepository.authenticate(email, password).then((value) {
      AppData.instance.saveToken(value.payload?.access?.token ?? "");
      emit(state.copyWith(
        alertStatus: value.code == 401 ? AlertStatus.visibility : AlertStatus.none,
      ));
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          statusFunction(obj);
      }
    }).whenComplete(() {
      emit(state.copyWith(status: AuthorizationStatus.complete));
    });
  }

  statusFunction(var obj) {
    if (obj.response == null) {
      return emit(state.copyWith(
        alertStatus: AlertStatus.visibility,
        status: AuthorizationStatus.error,
        statusError: 'Error Authorization',
        errorMessage: 'Something went wrong, please try later ${obj.response}',
      ));
    } else if (obj.response!.statusCode == 401) {
      return emit(state.copyWith(
        alertStatus: AlertStatus.visibility,
        status: AuthorizationStatus.error,
        statusError: 'Wrong login details!',
        errorMessage: 'Something went wrong, please try later ${obj.response}',
      ));
    } else {
      return emit(state.copyWith(alertStatus: AlertStatus.none));
    }
  }

  void clearState() {
    emit(state.copyWith(
      email: '',
      confirmCode: '',
      status: AuthorizationStatus.initial,
    ));
  }
}