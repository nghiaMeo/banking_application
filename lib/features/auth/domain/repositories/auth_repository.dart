import 'package:bank_app/features/auth/domain/entities/auth_result_entity.dart';

abstract class AuthRepository {
  Future<AuthResultEntity> signIn({
    required String email,
    required String password,
  });

  Future<AuthResultEntity> signUp({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  });
}
