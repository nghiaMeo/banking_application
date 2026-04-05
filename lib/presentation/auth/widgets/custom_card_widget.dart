import 'package:flutter/material.dart';

import '../../../core/theme/colors_theme.dart';

Widget customCardWidget(BuildContext context, {required Widget child}) {
  return Container(
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
    child: child,
  );
}
