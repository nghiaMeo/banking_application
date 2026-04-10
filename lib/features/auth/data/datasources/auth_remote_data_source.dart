import 'package:bank_app/core/network/api_error.dart';
import 'package:bank_app/core/network/dio_client.dart';
import 'package:bank_app/features/auth/data/models/auth_response_model.dart';
import 'package:bank_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:bank_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource({Dio? dio}) : _dio = dio ?? DioClient.create();

  Future<AuthResponseModel> signIn(SignInRequestModel request) async {
    try {
      final response = await _dio.post(
        '/api/auth/login',
        data: request.toJson(),
      );
      return AuthResponseModel.fromEnvelope(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiError(_extractMessage(e));
    }
  }

  Future<AuthResponseModel> signUp(SignUpRequestModel request) async {
    try {
      final response = await _dio.post(
        '/api/auth/register',
        data: request.toJson(),
      );
      return AuthResponseModel.fromEnvelope(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiError(_extractMessage(e));
    }
  }

  String _extractMessage(DioException e) {
    final response = e.response?.data;
    if (response is Map<String, dynamic>) {
      final message = response['message'];
      if (message != null) return message.toString();
    }
    return e.message ?? 'Unexpected network error';
  }
}
