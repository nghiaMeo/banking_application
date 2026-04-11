import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTabPage extends ConsumerStatefulWidget {
  const SearchTabPage({super.key, this.onBack});

  /// Khi mở dưới dạng tab: quay về tab Home. Nếu null, thử `Navigator.pop`.
  final VoidCallback? onBack;

  @override
  ConsumerState<SearchTabPage> createState() => _SearchTabPageState();
}

class _SearchTabPageState extends ConsumerState<SearchTabPage> {
  static const List<_SearchMenuEntry> _entries = [
    _SearchMenuEntry(
      title: 'Branch',
      subtitle: 'Search for branch',
      vectorAsset: AppVectors.branch,
      iconTint: ColorsTheme.firstPrimary,
    ),
    _SearchMenuEntry(
      title: 'Interest rate',
      subtitle: 'Search for interest rate',
      vectorAsset: AppVectors.interestRate,
      iconTint: ColorsTheme.fifthSemantic,
    ),
    _SearchMenuEntry(
      title: 'Exchange rate',
      subtitle: 'Search for exchange rate',
      vectorAsset: AppVectors.exchangeRate,
      iconTint: ColorsTheme.secondSemantic,
    ),
    _SearchMenuEntry(
      title: 'Exchange',
      subtitle: 'Exchange amount of money',
      vectorAsset: AppVectors.exchange,
      iconTint: null,
    ),
  ];

  void _handleBack(BuildContext context) {
    if (widget.onBack != null) {
      widget.onBack!();
    } else if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
            child: Row(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => _handleBack(context),
                  child: SvgPicture.asset(
                    AppVectors.left,
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                      ColorsTheme.neutralGreyDeep,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TypoTheme.titleSemiBold_20(
                  context,
                  ColorsTheme.neutralGreyDeep,
                  text: 'Search',
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              itemCount: _entries.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _SearchMenuCard(entry: _entries[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchMenuEntry {
  const _SearchMenuEntry({
    required this.title,
    required this.subtitle,
    required this.vectorAsset,
    required this.iconTint,
  });

  final String title;
  final String subtitle;
  final String vectorAsset;
  final Color? iconTint;
}

class _SearchMenuCard extends StatelessWidget {
  const _SearchMenuCard({required this.entry});

  final _SearchMenuEntry entry;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TypoTheme.titleSemiBold_16(
                      context,
                      ColorsTheme.neutralGreyDeep,
                      text: entry.title,
                    ),
                    const SizedBox(height: 6),
                    TypoTheme.bodyRegular_16(
                      context,
                      ColorsTheme.neutralGreyMid,
                      text: entry.subtitle,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _SearchCardIllustration(entry: entry),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchCardIllustration extends StatelessWidget {
  const _SearchCardIllustration({required this.entry});

  final _SearchMenuEntry entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(entry.vectorAsset, fit: BoxFit.contain),
      ),
    );
  }
}
