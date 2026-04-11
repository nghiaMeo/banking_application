import 'package:flutter/material.dart';

import '../../../../core/theme/colors_theme.dart';
import '../../../../core/theme/typo_theme.dart';

Widget bankCardWidget(BuildContext context) {
  return SizedBox(
    height: 220,
    child: Stack(
      children: [
        Positioned(
          left: 26,
          right: 26,
          bottom: 22,
          child: Container(
            height: 18,
            decoration: BoxDecoration(
              color: ColorsTheme.secondPrimary.withOpacity(0.75),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 30,
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              color: ColorsTheme.firstSemantic,
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
              colors: [ColorsTheme.firstPrimary, ColorsTheme.secondSemantic],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -44,
                top: -34,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.22),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  TypoTheme.titleSemiBold_24(
                    context,
                    Colors.white,
                    text: 'John Smith',
                  ),
                  const SizedBox(height: 20),
                  TypoTheme.captionSemibold_14(
                    context,
                    Colors.white,
                    text: 'Amazon Platinum',
                  ),
                  const SizedBox(height: 10),
                  TypoTheme.bodyMedium_16(
                    context,
                    Colors.white,
                    text: '4756   ••••   ••••   9018',
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TypoTheme.titleSemiBold_24(
                        context,
                        Colors.white,
                        text: '\$3.469.52',
                      ),
                      TypoTheme.titleSemiBold_24(
                        context,
                        Colors.white,
                        text: 'VISA',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
