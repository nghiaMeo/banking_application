import 'package:bank_app/features/onboarding/domain/entities/onboarding_step_entity.dart';
import 'package:bank_app/features/onboarding/domain/repositories/onboarding_repository.dart';

class GetOnboardingStepsUseCase {
  final OnboardingRepository repository;

  const GetOnboardingStepsUseCase(this.repository);

  Future<List<OnboardingStepEntity>> call() {
    return repository.getSteps();
  }
}
