import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:bank_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class InterestRatePage extends ConsumerStatefulWidget {
  const InterestRatePage({super.key});

  @override
  ConsumerState<InterestRatePage> createState() => _InterestRatePageState();
}

class _InterestRatePageState extends ConsumerState<InterestRatePage> {
  final List<Map<String, String>> _interestRates = const [
    {'interestKind': 'Individual customers', 'deposit': '1m', 'rate': '4.50%'},
    {'interestKind': 'Corporate customers', 'deposit': '2m', 'rate': '5.50%'},
    {'interestKind': 'Individual customers', 'deposit': '1m', 'rate': '4.50%'},
    {'interestKind': 'Corporate customers', 'deposit': '6m', 'rate': '2.50%'},
    {'interestKind': 'Individual customers', 'deposit': '1m', 'rate': '4.50%'},
    {'interestKind': 'Corporate customers', 'deposit': '8m', 'rate': '6.50%'},
    {'interestKind': 'Individual customers', 'deposit': '1m', 'rate': '4.50%'},
    {'interestKind': 'Individual customers', 'deposit': '1m', 'rate': '.50%'},
    {'interestKind': 'Corporate customers', 'deposit': '7m', 'rate': '6.80%'},
    {'interestKind': 'Individual customers', 'deposit': '1m', 'rate': '4.50%'},
    {'interestKind': 'Individual customers', 'deposit': '12m', 'rate': '5.90'},
    {'interestKind': 'Individual customers', 'deposit': '1m', 'rate': '4.50%'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.neutralWhite,
      appBar: AppBarCustom(
        titleAppBar: 'Interest rate',
        backGroundColor: ColorsTheme.neutralWhite,
        colorElement: ColorsTheme.neutralGreyDeep,
        fallBackWidget: HomePage(),
      ),
      body: Column(
        children: [
          // Table header
          _buildTableHeader(),
          const Divider(height: 1, color: ColorsTheme.neutralVani),
          // Table body
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 24),
              itemCount: _interestRates.length,
              separatorBuilder: (context, index) =>
                  const Divider(height: 1, color: ColorsTheme.neutralVani),
              itemBuilder: (context, index) {
                return _buildTableRow(_interestRates[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              'Interest kind',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: ColorsTheme.neutralGreyLight,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Deposit',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: ColorsTheme.neutralGreyLight,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Rate',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: ColorsTheme.neutralGreyLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              item['interestKind'] ?? '',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorsTheme.neutralGreyDeep,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              item['deposit'] ?? '',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorsTheme.neutralGreyDeep,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              item['rate'] ?? '',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorsTheme.firstPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
