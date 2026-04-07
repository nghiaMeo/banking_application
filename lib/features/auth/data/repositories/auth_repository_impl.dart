import 'package:bank_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:bank_app/features/auth/data/mappers/auth_mapper.dart';
import 'package:bank_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:bank_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:bank_app/features/auth/domain/entities/auth_result_entity.dart';
import 'package:bank_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AuthResultEntity> signIn({
    required String email,
    required String password,
  }) async {
    final result = await remoteDataSource.signIn(
      SignInRequestModel(email: email, password: password),
    );
    return AuthMapper.toEntity(result);
  }

  @override
  Future<AuthResultEntity> signUp({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    final result = await remoteDataSource.signUp(
      SignUpRequestModel(
        fullName: fullName,
        email: email,
        phone: phone,
        password: password,
      ),
    );
    return AuthMapper.toEntity(result);
  }
}
