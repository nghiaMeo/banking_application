import 'package:bank_app/features/auth/domain/entities/auth_tokens_entity.dart';
import 'package:bank_app/features/auth/domain/entities/user_entity.dart';

class AuthResultEntity {
  final AuthTokensEntity tokens;
  final UserEntity user;

  const AuthResultEntity({
    required this.tokens,
    required this.user,
  });
}
