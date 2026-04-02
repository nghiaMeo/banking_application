import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/colors_theme.dart';

Widget inputFieldWidget(
  BuildContext context, {
  required String hint,
  Widget? trailing,
  bool obscureText = false,
}) {
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
            obscureText: obscureText,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: ColorsTheme.neutralGreyLight,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        if (trailing != null) trailing,
      ],
    ),
  );
}
