import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(0xFFF0F0F0)),
          ),
        ),
        child: Row(
          children: [
            _buildHomeActiveItem(context),
            const Spacer(),
            _buildIconItem(iconPath: AppVectors.search, index: 1),
            const Spacer(),
            _buildIconItem(iconPath: AppVectors.letterEmpty, index: 2),
            const Spacer(),
            _buildIconItem(iconPath: AppVectors.settingEmpty, index: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeActiveItem(BuildContext context) {
    final bool isActive = currentIndex == 0;
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () => onTap(0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? ColorsTheme.firstPrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppVectors.homeFill,
              width: 16,
              height: 16,
              colorFilter: ColorFilter.mode(
                isActive ? Colors.white : ColorsTheme.neutralGreyMid,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 6),
            TypoTheme.captionMedium_14(
              context,
              isActive ? Colors.white : ColorsTheme.neutralGreyMid,
              text: 'Home',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconItem({required String iconPath, required int index}) {
    final bool isActive = currentIndex == index;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: SvgPicture.asset(
          iconPath,
          width: 22,
          height: 22,
          colorFilter: ColorFilter.mode(
            isActive ? ColorsTheme.firstPrimary : ColorsTheme.neutralGreyMid,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
