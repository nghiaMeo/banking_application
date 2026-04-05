import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_navigator.dart';
import 'package:bank_app/presentation/auth/change_password_page.dart';
import 'package:bank_app/presentation/auth/forgot_password_page.dart';
import 'package:bank_app/presentation/auth/sign_up_page.dart';
import 'package:bank_app/presentation/auth/verify_code_page.dart';
import 'package:bank_app/presentation/auth/widgets/input_field_widget.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/asset/vectors/app_vectors.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        titleAppBar: "Sign in",
        colorElement: Colors.white,
        backGroundColor: ColorsTheme.firstPrimary,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: ColorsTheme.firstPrimary,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 22,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TypoTheme.titleSemiBold_24(
                          context,
                          ColorsTheme.firstPrimary,
                          text: 'Welcome Back',
                        ),
                        const SizedBox(height: 2),
                        TypoTheme.bodyMedium_14(
                          context,
                          ColorsTheme.neutralGreyMid,
                          text: 'Hello there, sign in to continue',
                        ),
                        const SizedBox(height: 20),
                        Center(child: SvgPicture.asset(AppVectors.signIn)),
                        const SizedBox(height: 24),
                        inputFieldWidget(context, hint: 'Text input'),
                        const SizedBox(height: 16),
                        inputFieldWidget(
                          context,
                          hint: 'Password',
                          obscureText: obscureText,
                          trailing: InkWell(
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: SvgPicture.asset(
                              obscureText ? AppVectors.show : AppVectors.hide,
                              color: ColorsTheme.neutralGreyMid,
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              AppNavigator.pushReplacement(
                                context,
                                ForgotPasswordPage(),
                              );
                            },
                            child: TypoTheme.bodyMedium_14(
                              context,
                              ColorsTheme.neutralWhiteGrey,
                              text: 'Forgot your password ?',
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsTheme.fourthPrimary,
                              foregroundColor: ColorsTheme.thirdPrimary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: TypoTheme.titleSemiBold_16(
                              context,
                              ColorsTheme.thirdPrimary,
                              text: 'Sign in',
                            ),
                          ),
                        ),
                        const SizedBox(height: 26),
                        Center(
                          child: Icon(
                            Icons.fingerprint_outlined,
                            color: ColorsTheme.firstPrimary,
                            size: 56,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TypoTheme.bodyMedium_14(
                                context,
                                ColorsTheme.neutralGreyDeep,
                                text: "Don't have an account?",
                              ),
                              SizedBox(width: 6),
                              InkWell(
                                onTap: () {
                                  AppNavigator.pushReplacement(
                                    context,
                                    SignUpPage(),
                                  );
                                },
                                child: TypoTheme.captionSemibold_14(
                                  context,
                                  ColorsTheme.firstPrimary,
                                  text: 'Sign Up',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
