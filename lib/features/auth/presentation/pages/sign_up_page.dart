import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:bank_app/core/utils/app_navigator.dart';
import 'package:bank_app/features/auth/application/auth_providers.dart';
import 'package:bank_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:bank_app/features/auth/presentation/widgets/button_widget.dart';
import 'package:bank_app/features/auth/presentation/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isCheck = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      appBar: AppBarCustom(
        titleAppBar: 'Sign up',
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
                        const SizedBox(height: 18),
                        _buildCheck(context),
                        const SizedBox(height: 30),
                        buttonWidget(
                          context,
                          title: isLoading ? 'Signing up...' : 'Sign up',
                          backgroundColorButton: isLoading
                              ? ColorsTheme.neutralGreyMid
                              : ColorsTheme.fourthPrimary,
                          textColor: ColorsTheme.neutralWhite,
                          onTap: isLoading
                              ? () {}
                              : () async {
                                  if (!isCheck) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Please agree to Term and Conditions',
                                        ),
                                      ),
                                    );
                                    return;
                                  }

                                  if (_passwordController.text !=
                                      _confirmPasswordController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Passwords do not match'),
                                      ),
                                    );
                                    return;
                                  }

                                  final success = await ref
                                      .read(authProvider.notifier)
                                      .signUp(
                                        fullName: _fullNameController.text,
                                        email: _emailController.text,
                                        phone: _phoneController.text,
                                        password: _passwordController.text,
                                      );

                                  if (!context.mounted) return;

                                  if (success) {
                                    AppNavigator.pushReplacement(
                                      context,
                                      const SignInPage(),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          authState.errorMessage ??
                                              'Registration failed',
                                        ),
                                      ),
                                    );
                                  }
                                },
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TypoTheme.bodyMedium_14(
                                context,
                                ColorsTheme.neutralGreyDeep,
                                text: 'Have an account? ',
                              ),
                              const SizedBox(width: 6),
                              InkWell(
                                onTap: () {
                                  AppNavigator.pushReplacement(
                                    context,
                                    const SignInPage(),
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
          text: 'Hello there, create New account',
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
        inputFieldWidget(
          context,
          hint: 'Full name',
          controller: _fullNameController,
        ),
        const SizedBox(height: 24),
        inputFieldWidget(context, hint: 'Email', controller: _emailController),
        const SizedBox(height: 24),
        inputFieldWidget(
          context,
          hint: 'Phone number',
          controller: _phoneController,
        ),
        const SizedBox(height: 24),
        inputFieldWidget(
          context,
          hint: 'Password',
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          trailing: InkWell(
            onTap: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
            child: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: ColorsTheme.neutralGreyLight,
            ),
          ),
        ),
        const SizedBox(height: 24),
        inputFieldWidget(
          context,
          hint: 'Confirm password',
          controller: _confirmPasswordController,
          obscureText: !_isConfirmPasswordVisible,
          trailing: InkWell(
            onTap: () {
              setState(() {
                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
              });
            },
            child: Icon(
              _isConfirmPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: ColorsTheme.neutralGreyLight,
            ),
          ),
        ),
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
            isCheck ? AppVectors.checked : AppVectors.check,
            height: 24,
            width: 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'By creating an account your agree to our ',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: ColorsTheme.neutralGreyMid,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              children: [
                TextSpan(
                  text: 'Term and Conditions',
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
