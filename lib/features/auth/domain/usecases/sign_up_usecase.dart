import 'package:bank_app/features/auth/domain/entities/auth_result_entity.dart';
import 'package:bank_app/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  const SignUpUseCase(this.repository);

  Future<AuthResultEntity> call({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) {
    return repository.signUp(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
    );
  }
}
