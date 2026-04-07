import 'package:bank_app/features/onboarding/domain/entities/onboarding_step_entity.dart';

class OnboardingStepModel {
  final String title;
  final String description;

  const OnboardingStepModel({
    required this.title,
    required this.description,
  });

  OnboardingStepEntity toEntity() {
    return OnboardingStepEntity(
      title: title,
      description: description,
    );
  }
}
