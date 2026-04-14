import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/colors_theme.dart';
import '../../../../core/theme/typo_theme.dart';

Widget homeHeaderWidget(BuildContext context) {
  return Row(
    children: [
      InkWell(
        onTap: () {},
        child: const CircleAvatar(
          radius: 19,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300',
          ),
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: TypoTheme.titleSemiBold_20(
          context,
          Colors.white,
          text: 'Hi, Push Puttichai',
        ),
      ),
      InkWell(
        onTap: () {},
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(AppVectors.bell, color: Colors.white),
            Positioned(
              right: -1,
              top: -4,
              child: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: ColorsTheme.firstSemantic,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
