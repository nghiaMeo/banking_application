import 'package:bank_app/features/auth/data/models/user_model.dart';

class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;
  final UserModel user;

  const AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  });

  factory AuthResponseModel.fromEnvelope(Map<String, dynamic> json) {
    final data = (json['data'] as Map<String, dynamic>?) ?? {};
    return AuthResponseModel(
      accessToken: (data['accessToken'] ?? '').toString(),
      refreshToken: (data['refreshToken'] ?? '').toString(),
      tokenType: (data['tokenType'] ?? '').toString(),
      expiresIn: (data['expiresIn'] as num?)?.toInt() ?? 0,
      user: UserModel.fromJson(
        (data['userResponse'] as Map<String, dynamic>?) ?? {},
      ),
    );
  }
}
