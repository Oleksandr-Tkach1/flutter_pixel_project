import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_event.dart';
import 'package:flutter_pixel_project/data/app_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/main.dart';
import 'package:logger/logger.dart';

class OauthInterceptor extends InterceptorsWrapper {
  final log = Logger();

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path.contains('/v2/auth/login')) {
      options.headers["Authorization"] = 'Basic ' '<basic token>'; // add basic token here
    } else {
      final String? accessToken = await AppData.instance.getAccessToken();
      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers["Authorization"] = "Bearer $accessToken";
      }
    }
    super.onRequest(options, handler);
  }

    @override
    Future onError(DioError err, ErrorInterceptorHandler handler) async {
        if(err.response?.statusCode == 401 && err.response == null){
        BlocProvider.of<AuthenticationBloc>(MainAppState.getContext()).add(LoggedOut());
      }
      return onError(err, handler);
    }

    checkInternetConnectionIn () async{
      final result = await Connectivity().checkConnectivity();
      BlocProvider.of<AuthenticationBloc>(MainAppState.getContext()).checkInternetConnection(result);
    }
  }