import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppBar;
  final Color backGroundColor;

  const AppBarCustom({
    super.key,
    required this.titleAppBar,
    required this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backGroundColor,
      elevation: 0,
      leadingWidth: 0,
      title: Row(
        children: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(AppVectors.left, height: 16, width: 16),
          ),
          SizedBox(width: 10),
          TypoTheme.titleSemiBold_20(context, Colors.white, text: titleAppBar),
        ],
      ),
      toolbarHeight: 60,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
