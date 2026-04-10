import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/features/auth/presentation/widgets/input_field_widget.dart';
import 'package:flutter/cupertino.dart';

Widget textFieldCustomWidget(
  BuildContext context,
  TextEditingController? phoneController, {
  required String title,
  required Color color,
  required String hint,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TypoTheme.captionSemibold_14(context, color, text: title),
      const SizedBox(height: 12),
      inputFieldWidget(context, hint: hint, controller: phoneController),
    ],
  );
}
