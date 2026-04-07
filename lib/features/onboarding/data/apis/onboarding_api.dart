class OnboardingApi {
  Future<List<Map<String, dynamic>>> fetchSteps() async {
    // Placeholder API response. Replace with real endpoint when available.
    return [
      {
        'title': 'Welcome',
        'description': 'Manage your finance easily in one app.',
      },
      {
        'title': 'Secure',
        'description': 'Your account is protected with modern security.',
      },
      {
        'title': 'Get Started',
        'description': 'Create an account and start using banking services.',
      },
    ];
  }
}
