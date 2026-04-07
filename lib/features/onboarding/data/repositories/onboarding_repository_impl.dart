import 'package:bank_app/features/onboarding/data/apis/onboarding_api.dart';
import 'package:bank_app/features/onboarding/data/models/onboarding_step_model.dart';
import 'package:bank_app/features/onboarding/domain/entities/onboarding_step_entity.dart';
import 'package:bank_app/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingApi api;

  const OnboardingRepositoryImpl({
    required this.api,
  });

  @override
  Future<List<OnboardingStepEntity>> getSteps() async {
    final data = await api.fetchSteps();
    return data
        .map(
          (e) => OnboardingStepModel(
            title: (e['title'] ?? '').toString(),
            description: (e['description'] ?? '').toString(),
          ),
        )
        .map((e) => e.toEntity())
        .toList();
  }
}
