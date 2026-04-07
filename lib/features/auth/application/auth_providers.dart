import 'package:bank_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:bank_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bank_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:bank_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:bank_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:bank_app/features/auth/presentation/providers/auth_notifier.dart';
import 'package:bank_app/features/auth/presentation/providers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final _authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource();
});

final _authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.read(_authRemoteDataSourceProvider),
  );
});

final _signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(ref.read(_authRepositoryProvider));
});

final _signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  return SignUpUseCase(ref.read(_authRepositoryProvider));
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    signInUseCase: ref.read(_signInUseCaseProvider),
    signUpUseCase: ref.read(_signUpUseCaseProvider),
  );
});
