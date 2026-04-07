import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:bank_app/core/utils/app_navigator.dart';
import 'package:bank_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:bank_app/features/auth/presentation/pages/verify_code_page.dart';
import 'package:bank_app/features/auth/presentation/widgets/button_widget.dart';
import 'package:bank_app/features/auth/presentation/widgets/custom_card_widget.dart';
import 'package:bank_app/features/auth/presentation/widgets/text_field_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.neutralWhileLight,
      appBar: AppBarCustom(
        titleAppBar: 'Forgot password',
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
                  textFieldCustomWidget(
                    context,
                    _phoneController,
                    title: 'Type your phone number',
                    color: ColorsTheme.neutralGreyMid,
                    hint: '(+84)',
                  ),
                  const SizedBox(height: 16),
                  TypoTheme.bodyMedium_14(
                    context,
                    ColorsTheme.neutralGreyDeep,
                    text: 'We texted you a code to verify your phone number',
                  ),
                  const SizedBox(height: 32),
                  buttonWidget(
                    context,
                    title: 'Send',
                    backgroundColorButton: ColorsTheme.fourthPrimary,
                    textColor: Colors.white,
                    onTap: () {
                      AppNavigator.pushReplacement(
                        context,
                        VerifyCodePage(phoneNumber: _phoneController.text),
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
}
