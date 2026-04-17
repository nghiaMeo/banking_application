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
          border: Border(top: BorderSide(color: ColorsTheme.neutralVani)),
        ),
        child: Row(
          children: [
            _buildNavItem(
              context,
              index: 0,
              label: 'Home',
              iconInactive: AppVectors.home,
              iconActive: AppVectors.homeFill,
            ),
            const Spacer(),
            _buildNavItem(
              context,
              index: 1,
              label: 'Search',
              iconInactive: AppVectors.search,
              iconActive: AppVectors.search,
            ),
            const Spacer(),
            _buildNavItem(
              context,
              index: 2,
              label: 'Message',
              iconInactive: AppVectors.letterEmpty,
              iconActive: AppVectors.letter,
            ),
            const Spacer(),
            _buildNavItem(
              context,
              index: 3,
              label: 'Setting',
              iconInactive: AppVectors.settingEmpty,
              iconActive: AppVectors.setting,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required String label,
    required String iconInactive,
    required String iconActive,
  }) {
    final bool isActive = currentIndex == index;
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? 12 : 6,
          vertical: isActive ? 8 : 6,
        ),
        decoration: BoxDecoration(
          color: isActive ? ColorsTheme.firstPrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isActive ? iconActive : iconInactive,
              width: isActive ? 16 : 22,
              height: isActive ? 16 : 22,
              colorFilter: ColorFilter.mode(
                isActive ? Colors.white : ColorsTheme.neutralGreyMid,
                BlendMode.srcIn,
              ),
            ),
            if (isActive) ...[
              const SizedBox(width: 6),
              TypoTheme.captionMedium_14(context, Colors.white, text: label),
            ],
          ],
        ),
      ),
    );
  }
}
