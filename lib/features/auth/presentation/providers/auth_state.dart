class AuthState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const AuthState({
    required this.isLoading,
    required this.isSuccess,
    this.errorMessage,
  });

  const AuthState.initial()
      : isLoading = false,
        isSuccess = false,
        errorMessage = null;

  AuthState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool clearError = false,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
