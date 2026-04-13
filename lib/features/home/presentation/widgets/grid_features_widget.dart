import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget gridFeaturesWidget(BuildContext context) {
  final List<Map<String, Object>> items = [
    {
      'svg': AppVectors.wallet,
      'color': ColorsTheme.firstPrimary,
      'label': 'Account\nand Card',
    },
    const {
      'svg': AppVectors.syncDevices,
      'color': ColorsTheme.firstSemantic,
      'label': 'Transfer',
    },
    const {
      'svg': AppVectors.creditCardIn,
      'color': ColorsTheme.secondSemantic,
      'label': 'Withdraw',
    },
    const {
      'svg': AppVectors.mobileBanking,
      'color': ColorsTheme.thirdSemantic,
      'label': 'Mobile\nprepaid',
    },
    const {
      'svg': AppVectors.receiptList,
      'color': ColorsTheme.fourthSemantic,
      'label': 'Pay the\nbill',
    },
    const {
      'svg': AppVectors.pig,
      'color': ColorsTheme.secondPrimary,
      'label': 'Save\nonline',
    },
    const {
      'svg': AppVectors.creditCard,
      'color': ColorsTheme.fifthSemantic,
      'label': 'Credit\ncard',
    },
    const {
      'svg': AppVectors.fileParagraph,
      'color': ColorsTheme.firstPrimary,
      'label': 'Transaction\nreport',
    },
    const {
      'svg': AppVectors.contacts,
      'color': ColorsTheme.firstSemantic,
      'label': 'Beneficiary',
    },
  ];

  return GridView.builder(
    itemCount: items.length,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.95,
    ),
    itemBuilder: (context, index) {
      final item = items[index];
      final svg = item['svg'] as String;
      final color = item['color'] as Color;
      final label = item['label'] as String;

      return InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: ColorsTheme.neutralWhite,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: ColorsTheme.neutralVani,
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(svg, color: color),
              const SizedBox(height: 9),
              TypoTheme.bodyMedium_12(
                context,
                ColorsTheme.neutralGreyMid,
                text: label,
              ),
            ],
          ),
        ),
      );
    },
  );
}
