import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:flutter/material.dart';

Widget buttonWidget(
  BuildContext context, {
  required String title,
  required Color backgroundColorButton,
  required Color textColor,
  required VoidCallback onTap,
}) {
  return SizedBox(
    width: double.infinity,
    height: 52,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColorButton,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: TypoTheme.titleSemiBold_16(context, textColor, text: title),
    ),
  );
}
