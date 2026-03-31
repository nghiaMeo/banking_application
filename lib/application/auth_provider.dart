import 'package:bank_app/api/auth_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final authProvider = StateNotifierProvider<AuthProvider, bool>((ref) {
  return AuthProvider(ref);
});

class AuthProvider extends StateNotifier<bool> {
  final Ref ref;

  AuthProvider(this.ref) : super(true);

  Future signIn(String email, String password) async {
    final api = AuthApi();
    state = true; // loading api

    try {
      await api.signIn(email, password);
      print("Sign in success");
    } catch (e) {
      print("Sign in failed: $e");
    }
    state = false;
  }
}
