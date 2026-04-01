import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/utilis/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/asset/vectors/app_vectors.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarCustom(titleAppBar: "Sign in", backGroundColor: ColorsTheme.firstPrimary),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                      // const _LockIllustration(),
                      const SizedBox(height: 24),
                      _buildInputField(hint: 'Text input'),
                      const SizedBox(height: 16),
                      _buildInputField(
                        hint: 'Password',
                        trailing: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TypoTheme.bodyMedium_14(
                          context,
                          ColorsTheme.neutralWhiteGrey,
                          text: 'Forgot your password ?',
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
                            const SizedBox(width: 6),
                            TypoTheme.captionSemibold_14(
                              context,
                              ColorsTheme.firstPrimary,
                              text: 'Sign Up',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required String hint, Widget? trailing}) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.black26),
              ),
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}

class _LockIllustration extends StatelessWidget {
  const _LockIllustration();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 220,
        height: 160,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
              top: 2,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: ColorsTheme.firstPrimary,
              ),
            ),
            Positioned(
              left: 24,
              top: 56,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: ColorsTheme.fourthSemantic,
              ),
            ),
            Positioned(
              left: 42,
              bottom: 28,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: ColorsTheme.thirdSemantic,
              ),
            ),
            Positioned(
              right: 20,
              top: 30,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: ColorsTheme.firstSemantic,
              ),
            ),
            Positioned(
              right: 34,
              bottom: 34,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: ColorsTheme.secondSemantic,
              ),
            ),
            CircleAvatar(
              radius: 62,
              backgroundColor: ColorsTheme.fourthPrimary,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: ColorsTheme.firstPrimary,
                child: const Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
