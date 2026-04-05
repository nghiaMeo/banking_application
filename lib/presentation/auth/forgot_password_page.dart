import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_navigator.dart';
import 'package:bank_app/presentation/auth/sign_in_page.dart';
import 'package:bank_app/presentation/auth/verify_code_page.dart';
import 'package:bank_app/presentation/auth/widgets/button_widget.dart';
import 'package:bank_app/presentation/auth/widgets/input_field_widget.dart';
import 'package:bank_app/presentation/auth/widgets/text_field_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 48,
        leading: InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            AppNavigator.pop(context, fallBackWidget: SignInPage());
          },
          child: SafeArea(
            child: Center(
              child: SvgPicture.asset(
                AppVectors.left,
                height: 16,
                width: 16,
                colorFilter: const ColorFilter.mode(
                  ColorsTheme.neutralGreyDeep,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
        title: TypoTheme.titleSemiBold_20(
          context,
          ColorsTheme.neutralGreyDeep,
          text: "Forgot password",
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 20.0,
            ),
            child: Container(
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
                  textFieldCustomWidget(
                    context,
                    _phoneController,
                    title: "Type your phone number",
                    color: ColorsTheme.neutralGreyMid,
                    hint: "(+84)",
                  ),
                  const SizedBox(height: 16),
                  TypoTheme.bodyMedium_14(
                    context,
                    ColorsTheme.neutralGreyDeep,
                    text: "We texted you a code to verify your phone number",
                  ),
                  const SizedBox(height: 32),
                  buttonWidget(
                    context,
                    title: "Send",
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
