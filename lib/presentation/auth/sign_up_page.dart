import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        titleAppBar: "Sign up",
        backGroundColor: ColorsTheme.firstPrimary,
      ),
      body: Container(
        color: ColorsTheme.firstPrimary,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          )

          ,
        ),
      ),
    );
  }
}
