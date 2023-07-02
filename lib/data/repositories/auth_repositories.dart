import 'package:flutter_pixel_project/data/model/request/auth_request.dart';
import 'package:flutter_pixel_project/data/source/login_data_source.dart';
import '../../network/auth_server_api.dart';
import '../model/api/response/TokenResponse.dart';

class AuthRepository extends AuthDataSource {
  final AuthRestClient authClient;

  AuthRepository(this.authClient);

  @override
  Future<TokenResponse> authenticate(String email, String password) {
    return authClient.authenticate(AuthRequest(email, password));
  }
}