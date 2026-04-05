import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:bank_app/core/utils/app_navigator.dart';
import 'package:bank_app/presentation/auth/sign_in_page.dart';
import 'package:bank_app/presentation/auth/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'change_password_page.dart';

class VerifyCodePage extends ConsumerStatefulWidget {
  final String phoneNumber;

  const VerifyCodePage({super.key, required this.phoneNumber});

  @override
  ConsumerState<VerifyCodePage> createState() => _GetCodePageState();
}

class _GetCodePageState extends ConsumerState<VerifyCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBarCustom(
        titleAppBar: "Verify code",
        backGroundColor: Colors.transparent,
        colorElement: ColorsTheme.neutralGreyDeep,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 20.0,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: ColorsTheme.neutralWhite,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TypoTheme.captionSemibold_14(
                        context,
                        ColorsTheme.neutralGreyMid,
                        text: "Type a code",
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: inputFieldWidget(context, hint: "Code"),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsTheme.firstPrimary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: TypoTheme.titleSemiBold_16(
                                context,
                                Colors.white,
                                text: 'Resend',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      RichText(
                        text: TextSpan(
                          text:
                              "We texted you a code to verify your phone number (+84) ",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: ColorsTheme.neutralGreyMid,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          children: [
                            TextSpan(
                              text: widget.phoneNumber,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: ColorsTheme.firstPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      TypoTheme.bodyMedium_14(
                        context,
                        ColorsTheme.neutralGreyMid,
                        text:
                            "This code will expired 10 minutes after this message. If you don't get a message.",
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            AppNavigator.pushReplacement(
                              context,
                              ChangePasswordPage(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsTheme.fourthPrimary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: TypoTheme.titleSemiBold_16(
                            context,
                            Colors.white,
                            text: 'Change password',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: () {},
                  child: TypoTheme.captionSemibold_14(
                    context,
                    ColorsTheme.firstPrimary,
                    text: 'Change your phone number',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
