import 'package:bank_app/features/auth/domain/entities/auth_result_entity.dart';
import 'package:bank_app/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  const SignInUseCase(this.repository);

  Future<AuthResultEntity> call({
    required String email,
    required String password,
  }) {
    return repository.signIn(email: email, password: password);
  }
}
