import 'package:bank_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:bank_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:bank_app/features/auth/presentation/providers/auth_state.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;

  AuthNotifier({
    required this.signInUseCase,
    required this.signUpUseCase,
  }) : super(const AuthState.initial());

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, isSuccess: false, clearError: true);
    try {
      await signInUseCase(email: email, password: password);
      state = state.copyWith(isLoading: false, isSuccess: true, clearError: true);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  Future<bool> signUp({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, isSuccess: false, clearError: true);
    try {
      await signUpUseCase(
        fullName: fullName,
        email: email,
        phone: phone,
        password: password,
      );
      state = state.copyWith(isLoading: false, isSuccess: true, clearError: true);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }
}
