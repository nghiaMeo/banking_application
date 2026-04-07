import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:bank_app/core/utils/app_navigator.dart';
import 'package:bank_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:bank_app/features/auth/presentation/pages/success_change_password_page.dart';
import 'package:bank_app/features/auth/presentation/widgets/button_widget.dart';
import 'package:bank_app/features/auth/presentation/widgets/custom_card_widget.dart';
import 'package:bank_app/features/auth/presentation/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  bool obscureText1 = true;
  bool obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.neutralWhileLight,
      appBar: AppBarCustom(
        titleAppBar: 'Change password',
        backGroundColor: Colors.transparent,
        colorElement: ColorsTheme.neutralGreyDeep,
        fallBackWidget: const SignInPage(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 20.0,
            ),
            child: customCardWidget(
              context,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInputFields(
                    context,
                    title: 'Type your new password',
                    hint: '*************',
                    obscureText: obscureText1,
                    onToggle: () {
                      setState(() {
                        obscureText1 = !obscureText1;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildInputFields(
                    context,
                    title: 'Confirm your new password',
                    hint: '*************',
                    obscureText: obscureText2,
                    onToggle: () {
                      setState(() {
                        obscureText2 = !obscureText2;
                      });
                    },
                  ),
                  const SizedBox(height: 32),
                  buttonWidget(
                    context,
                    title: 'Change password',
                    backgroundColorButton: ColorsTheme.fourthPrimary,
                    textColor: Colors.white,
                    onTap: () {
                      AppNavigator.pushReplacement(
                        context,
                        const SuccessChangePasswordPage(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputFields(
    BuildContext context, {
    required String title,
    required String hint,
    required bool obscureText,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypoTheme.captionSemibold_14(
          context,
          ColorsTheme.neutralGreyMid,
          text: title,
        ),
        const SizedBox(height: 12),
        inputFieldWidget(
          context,
          hint: hint,
          obscureText: obscureText,
          trailing: InkWell(
            onTap: onToggle,
            child: SvgPicture.asset(
              obscureText ? AppVectors.show : AppVectors.hide,
              colorFilter: const ColorFilter.mode(
                ColorsTheme.neutralGreyMid,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
