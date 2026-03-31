import 'package:dio/dio.dart';

class AuthApi {
  final Dio dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080'));

  Future signIn(String email, String password) async {
    final response = await dio.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    return response.data;
  }
}
