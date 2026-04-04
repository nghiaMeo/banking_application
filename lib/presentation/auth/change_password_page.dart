import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_navigator.dart';
import 'package:bank_app/presentation/auth/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
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
            AppNavigator.pop(context);
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
          text: "Change password",
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
                  TypoTheme.captionSemibold_14(
                    context,
                    ColorsTheme.neutralGreyMid,
                    text: "Type your new password",
                  ),
                  const SizedBox(height: 12),
                  inputFieldWidget(
                    context,
                    hint: "***********",
                    obscureText: true,
                    trailing: const Icon(
                      Icons.visibility,
                      color: ColorsTheme.neutralGreyMid,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TypoTheme.captionSemibold_14(
                    context,
                    ColorsTheme.neutralGreyMid,
                    text: "Confirm password",
                  ),
                  const SizedBox(height: 12),
                  inputFieldWidget(
                    context,
                    hint: "***********",
                    obscureText: true,
                    trailing: const Icon(
                      Icons.visibility,
                      color: ColorsTheme.neutralGreyMid,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
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
                        text: 'Change password',
                      ),
                    ),
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
