import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorsTheme.neutralWhite,
      body: SafeArea(child: Column()),
    );
  }
}
