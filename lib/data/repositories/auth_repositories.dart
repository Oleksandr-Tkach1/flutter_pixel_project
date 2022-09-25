import 'package:flutter_pixel_project/data/app_data.dart';
import 'package:flutter_pixel_project/data/model/request/auth_request.dart';
import 'package:flutter_pixel_project/data/source/login_data_source.dart';
import 'package:flutter_pixel_project/network/server_api.dart';

class AuthRepository extends AuthDataSource {
  final RestClient client;

  AuthRepository(this.client);

  @override
  Future<void> authenticate(String email, String password) {
    return client.authenticate(AuthRequest(email, password)).then(
        (value) => {
          AppData.instance.saveToken(value.payload?.access?.token ?? "")
        });
  }
}
