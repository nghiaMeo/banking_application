import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:bank_app/presentation/auth/sign_in_page.dart';
import 'package:bank_app/presentation/auth/widgets/button_widget.dart';
import 'package:bank_app/presentation/auth/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/asset/vectors/app_vectors.dart';
import '../../core/utils/app_navigator.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        titleAppBar: "Sign up",
        backGroundColor: ColorsTheme.firstPrimary,
        colorElement: Colors.white,
        fallBackWidget: const SignInPage(),
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
                        _buildDescriptionTitle(context),
                        _buildInputFields(context),
                        SizedBox(height: 18),
                        _buildCheck(context),
                        SizedBox(height: 30),
                        buttonWidget(
                          context,
                          title: 'Sign up',
                          backgroundColorButton: ColorsTheme.fourthPrimary,
                          textColor: ColorsTheme.neutralWhite,
                          onTap: () {},
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TypoTheme.bodyMedium_14(
                                context,
                                ColorsTheme.neutralGreyDeep,
                                text: "Have an account? ",
                              ),
                              SizedBox(width: 6),
                              InkWell(
                                onTap: () {
                                  AppNavigator.pushReplacement(
                                    context,
                                    SignInPage(),
                                  );
                                },
                                child: TypoTheme.captionSemibold_14(
                                  context,
                                  ColorsTheme.firstPrimary,
                                  text: 'Sign In',
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

  Widget _buildDescriptionTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypoTheme.titleSemiBold_24(
          context,
          ColorsTheme.firstPrimary,
          text: 'Welcome to us,',
        ),
        const SizedBox(height: 2),
        TypoTheme.bodyMedium_14(
          context,
          ColorsTheme.neutralGreyMid,
          text: "Hello there, create New account",
        ),
      ],
    );
  }

  Widget _buildInputFields(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Center(child: SvgPicture.asset(AppVectors.signUp)),
        const SizedBox(height: 24),
        inputFieldWidget(context, hint: "Full name"),
        const SizedBox(height: 24),
        inputFieldWidget(context, hint: "Email"),
        const SizedBox(height: 24),
        inputFieldWidget(context, hint: "Phone number"),
        const SizedBox(height: 24),
        inputFieldWidget(context, hint: "Password"),
        const SizedBox(height: 24),
        inputFieldWidget(context, hint: "Confirm password"),
      ],
    );
  }

  Widget _buildCheck(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isCheck = !isCheck;
            });
          },
          child: SvgPicture.asset(
            isCheck == false ? AppVectors.check : AppVectors.checked,
            height: 24,
            width: 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "By creating an account your agree to our ",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: ColorsTheme.neutralGreyMid,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              children: [
                TextSpan(
                  text: "Term and Conditions",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: ColorsTheme.firstPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
