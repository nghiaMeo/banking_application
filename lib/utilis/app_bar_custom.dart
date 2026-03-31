import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends AppBar {
  final String titleAppBar;

  AppBarCustom(this.titleAppBar, {super.key});

  Widget build(BuildContext context) {
    return AppBar(
      title: TypoTheme.titleSemiBold_20(
        context,
        Colors.white,
        text: titleAppBar,
      ),
      centerTitle: false,
    );
  }
}
