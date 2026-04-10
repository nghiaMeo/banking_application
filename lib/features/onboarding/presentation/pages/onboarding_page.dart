import 'package:bank_app/features/onboarding/application/onboarding_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingAsync = ref.watch(onboardingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
      ),
      body: onboardingAsync.when(
        data: (steps) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: steps.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final step = steps[index];
            return ListTile(
              tileColor: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: Text(step.title),
              subtitle: Text(step.description),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text('Failed to load onboarding: $error'),
        ),
      ),
    );
  }
}
