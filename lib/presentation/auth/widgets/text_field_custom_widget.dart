import 'package:flutter/cupertino.dart';

import '../../../core/theme/colors_theme.dart';
import '../../../core/theme/typo_theme.dart';
import 'input_field_widget.dart';

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
