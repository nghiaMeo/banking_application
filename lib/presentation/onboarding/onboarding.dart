import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(titleAppBar: titleAppBar, backGroundColor: backGroundColor, colorElement: colorElement),
    );
  }
}
