import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/repositories/auth_repositories.dart';
import 'package:dio/dio.dart';
import '../../../../data/app_data.dart';
import 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  final AuthRepository _loginRepository;

  AuthorizationCubit(this._loginRepository) : super(const AuthorizationState());

  ///
  authenticate(String email, String password) {
    emit(state.copyWith(status: AuthorizationStatus.loading, alertStatus: AlertStatus.none));
    return
    _loginRepository.authenticate(email, password).then((value) {
      AppData.instance.saveToken(value.payload?.access?.token ?? "");
      emit(state.copyWith(
      alertStatus: value.code == 401 ? AlertStatus.visibility : AlertStatus.none,));
    })
    //     .whenComplete(() {
    //   emit(state.copyWith(status: AuthorizationStatus.complete));
    // })
        .catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final response = (obj as DioError).response;
          emit(state.copyWith(
            alertStatus: obj.response!.statusCode == 401 ? AlertStatus.visibility : AlertStatus.none,
              status: AuthorizationStatus.error,
              errorMessage: 'Something went wrong, please try later $response'));
      }
    }).whenComplete(() {
      emit(state.copyWith(status: AuthorizationStatus.complete));
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
