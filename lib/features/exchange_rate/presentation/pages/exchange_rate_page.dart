import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:bank_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ExchangeRatePage extends ConsumerStatefulWidget {
  const ExchangeRatePage({super.key});

  @override
  ConsumerState<ExchangeRatePage> createState() => _ExchangeRatePageState();
}

class _ExchangeRatePageState extends ConsumerState<ExchangeRatePage> {
  final List<Map<String, String>> _exchangeRates = const [
    {
      'country': 'Vietnam',
      'flag': AppVectors.vn,
      'buy': '1.403',
      'sell': '1.746',
    },
    {
      'country': 'Nicaragua',
      'flag': AppVectors.ni,
      'buy': '9.123',
      'sell': '12.09',
    },
    {
      'country': 'Korea',
      'flag': AppVectors.kr,
      'buy': '3.704',
      'sell': '5.151',
    },
    {
      'country': 'Russia',
      'flag': AppVectors.ru,
      'buy': '116.0',
      'sell': '144.4',
    },
    {
      'country': 'China',
      'flag': AppVectors.cn,
      'buy': '1.725',
      'sell': '2.234',
    },
    {
      'country': 'Portuguese',
      'flag': AppVectors.pt,
      'buy': '1.403',
      'sell': '1.746',
    },
    {
      'country': 'Korea',
      'flag': AppVectors.kr,
      'buy': '3.454',
      'sell': '4.312',
    },
    {
      'country': 'French',
      'flag': AppVectors.fr,
      'buy': '23.45',
      'sell': '34.56',
    },
    {
      'country': 'Nicaragua',
      'flag': AppVectors.ni,
      'buy': '263.1',
      'sell': '300.3',
    },
    {
      'country': 'China',
      'flag': AppVectors.cn,
      'buy': '1.725',
      'sell': '2.234',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.neutralWhite,
      appBar: AppBarCustom(
        titleAppBar: 'Exchange rate',
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
              itemCount: _exchangeRates.length,
              separatorBuilder: (context, index) =>
                  const Divider(height: 1, color: ColorsTheme.neutralVani),
              itemBuilder: (context, index) {
                return _buildTableRow(_exchangeRates[index]);
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
              'Country',
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
              'Buy',
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
              'Sell',
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
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            // Flag + Country name
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: SvgPicture.asset(
                      item['flag'] ?? '',
                      width: 28,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item['country'] ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorsTheme.neutralGreyDeep,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Buy
            Expanded(
              flex: 2,
              child: Text(
                item['buy'] ?? '',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorsTheme.neutralGreyDeep,
                ),
              ),
            ),
            // Sell
            Expanded(
              flex: 2,
              child: Text(
                item['sell'] ?? '',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorsTheme.neutralGreyDeep,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
