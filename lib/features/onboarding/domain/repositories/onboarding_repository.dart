import 'package:bank_app/features/onboarding/domain/entities/onboarding_step_entity.dart';

abstract class OnboardingRepository {
  Future<List<OnboardingStepEntity>> getSteps();
}
