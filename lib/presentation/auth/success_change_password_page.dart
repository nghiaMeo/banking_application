import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:bank_app/core/utils/app_navigator.dart';
import 'package:bank_app/presentation/auth/sign_in_page.dart';
import 'package:bank_app/presentation/auth/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessChangePasswordPage extends ConsumerStatefulWidget {
  const SuccessChangePasswordPage({super.key});

  @override
  ConsumerState<SuccessChangePasswordPage> createState() =>
      _SuccessChangePasswordPageState();
}

class _SuccessChangePasswordPageState
    extends ConsumerState<SuccessChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.neutralWhileLight,
      appBar: AppBarCustom(
        titleAppBar: '',
        backGroundColor: Colors.transparent,
        colorElement: ColorsTheme.neutralGreyDeep,
        fallBackWidget: const SignInPage(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Center(child: SvgPicture.asset(AppVectors.successPassword)),
              const SizedBox(height: 40),
              TypoTheme.titleSemiBold_16(
                context,
                ColorsTheme.firstPrimary,
                text: 'Change password successfully!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TypoTheme.bodyMedium_14(
                context,
                ColorsTheme.neutralGreyDeep,
                text:
                    'You have successfully change password.'
                    '\nPlease use the new password when Sign in.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              buttonWidget(
                context,
                title: 'Ok',
                backgroundColorButton: ColorsTheme.firstPrimary,
                textColor: Colors.white,
                onTap: () {
                  AppNavigator.pushReplacement(context, const SignInPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
