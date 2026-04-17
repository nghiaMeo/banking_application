import 'package:bank_app/features/onboarding/data/apis/onboarding_api.dart';
import 'package:bank_app/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:bank_app/features/onboarding/domain/entities/onboarding_step_entity.dart';
import 'package:bank_app/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:bank_app/features/onboarding/domain/usecases/get_onboarding_steps_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _onboardingApiProvider = Provider<OnboardingApi>((ref) {
  return OnboardingApi();
});

final _onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  return OnboardingRepositoryImpl(
    api: ref.read(_onboardingApiProvider),
  );
});

final _getOnboardingStepsUseCaseProvider = Provider<GetOnboardingStepsUseCase>((ref) {
  return GetOnboardingStepsUseCase(ref.read(_onboardingRepositoryProvider));
});

final onboardingProvider = FutureProvider<List<OnboardingStepEntity>>((ref) async {
  return ref.read(_getOnboardingStepsUseCaseProvider).call();
});
