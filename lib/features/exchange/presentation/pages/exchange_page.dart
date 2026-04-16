import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:bank_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExchangePage extends ConsumerStatefulWidget {
  const ExchangePage({super.key});

  @override
  ConsumerState<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends ConsumerState<ExchangePage> {
  final _fromAmountController = TextEditingController();
  final _toAmountController = TextEditingController();

  final List<_CurrencyOption> _currencies = const [
    _CurrencyOption(code: 'VND', name: 'Viet Nam Dong'),
    _CurrencyOption(code: 'HKS', name: 'Hong Kong Dollar'),
    _CurrencyOption(code: 'USD', name: 'Dollar'),
    _CurrencyOption(code: 'NTS', name: 'Taiwan Dollar'),
    _CurrencyOption(code: 'JS', name: 'Jamaika Dollar'),
    _CurrencyOption(code: 'NTS', name: 'Taiwan Dollar'),
    _CurrencyOption(code: 'JS', name: 'Jamaika Dollar'),
    _CurrencyOption(code: 'NTS', name: 'Taiwan Dollar'),
    _CurrencyOption(code: 'JS', name: 'Jamaika Dollar'),
    _CurrencyOption(code: 'NTS', name: 'Taiwan Dollar'),
    _CurrencyOption(code: 'JS', name: 'Jamaika Dollar'),
    _CurrencyOption(code: 'NTS', name: 'Taiwan Dollar'),
    _CurrencyOption(code: 'JS', name: 'Jamaika Dollar'),
    _CurrencyOption(code: 'NTS', name: 'Taiwan Dollar'),
    _CurrencyOption(code: 'JS', name: 'Jamaika Dollar'),
    _CurrencyOption(code: 'NTS', name: 'Taiwan Dollar'),
    _CurrencyOption(code: 'JS', name: 'Jamaika Dollar'),
  ];

  String _fromCurrency = 'USD';
  String _toCurrency = 'USD';

  @override
  void initState() {
    super.initState();
    _fromAmountController.addListener(_onTextChanged);
    _toAmountController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _fromAmountController.removeListener(_onTextChanged);
    _toAmountController.removeListener(_onTextChanged);
    _fromAmountController.dispose();
    _toAmountController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.neutralWhite,
      appBar: const AppBarCustom(
        titleAppBar: 'Exchange',
        backGroundColor: ColorsTheme.neutralWhite,
        colorElement: ColorsTheme.neutralGreyDeep,
        fallBackWidget: HomePage(),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            children: [
              _buildIllustration(),
              const SizedBox(height: 20),
              _buildAmountCard(
                context,
                label: 'From',
                controller: _fromAmountController,
                currencyCode: _fromCurrency,
                onCurrencyTap: () async {
                  final selected = await _showCurrencyPicker(
                    context,
                    selectedCode: _fromCurrency,
                  );
                  if (selected == null) return;
                  setState(() => _fromCurrency = selected);
                },
              ),
              const SizedBox(height: 14),
              _buildSwapButton(),
              const SizedBox(height: 14),
              _buildAmountCard(
                context,
                label: 'To',
                controller: _toAmountController,
                currencyCode: _toCurrency,
                onCurrencyTap: () async {
                  final selected = await _showCurrencyPicker(
                    context,
                    selectedCode: _toCurrency,
                  );
                  if (selected == null) return;
                  setState(() => _toCurrency = selected);
                },
              ),
              const SizedBox(height: 26),
              _buildExchangeButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIllustration() {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: SvgPicture.asset(
        AppVectors.currency,
        height: 170,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildAmountCard(
    BuildContext context, {
    required String label,
    required TextEditingController controller,
    required String currencyCode,
    required VoidCallback onCurrencyTap,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: ColorsTheme.neutralWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsTheme.neutralVani),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypoTheme.bodyMedium_14(
            context,
            ColorsTheme.neutralGreyLight,
            text: label,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Amount',
                    hintStyle: TextStyle(color: ColorsTheme.neutralWhiteGrey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(width: 1, height: 24, color: ColorsTheme.neutralVani),
              const SizedBox(width: 12),
              InkWell(
                onTap: onCurrencyTap,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TypoTheme.bodyMedium_14(
                      context,
                      ColorsTheme.neutralGreyDeep,
                      text: currencyCode,
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      AppVectors.downSmall,
                      width: 14,
                      height: 14,
                      colorFilter: const ColorFilter.mode(
                        ColorsTheme.neutralGreyMid,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSwapButton() {
    return SizedBox(
      height: 34,
      child: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              final tmpCurrency = _fromCurrency;
              _fromCurrency = _toCurrency;
              _toCurrency = tmpCurrency;

              final tmpAmount = _fromAmountController.text;
              _fromAmountController.text = _toAmountController.text;
              _toAmountController.text = tmpAmount;
            });
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 54,
            height: 34,
            decoration: BoxDecoration(
              color: ColorsTheme.neutralWhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorsTheme.neutralVani),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppVectors.down,
                  width: 16,
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    ColorsTheme.firstPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 6),
                SvgPicture.asset(
                  AppVectors.up,
                  width: 16,
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    ColorsTheme.firstSemantic,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExchangeButton(BuildContext context) {
    final isEnabled =
        _fromAmountController.text.trim().isNotEmpty &&
        _toAmountController.text.trim().isNotEmpty;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isEnabled ? () {} : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsTheme.firstPrimary,
          disabledBackgroundColor: ColorsTheme.fourthPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: TypoTheme.titleSemiBold_16(
          context,
          isEnabled ? ColorsTheme.neutralWhite : ColorsTheme.thirdPrimary,
          text: 'Exchange',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future<String?> _showCurrencyPicker(
    BuildContext context, {
    required String selectedCode,
  }) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        final media = MediaQuery.of(dialogContext);
        final dialogWidth = media.size.width * 0.86;

        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: dialogWidth,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              decoration: BoxDecoration(
                color: ColorsTheme.neutralWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: TypoTheme.titleSemiBold_16(
                            dialogContext,
                            ColorsTheme.neutralGreyDeep,
                            text: 'Select the currency',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(dialogContext).pop(),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        child: const Icon(
                          Icons.close,
                          color: ColorsTheme.neutralGreyMid,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Giới hạn chiều cao để danh sách có thể scroll khi nhiều hơn ~20 items.
                  SizedBox(
                    height: (media.size.height * 0.55).clamp(220.0, 380.0),
                    child: ListView.separated(
                      itemCount: _currencies.length,
                      separatorBuilder: (_, __) => const Divider(
                        height: 1,
                        color: ColorsTheme.neutralVani,
                      ),
                      itemBuilder: (context, index) {
                        final item = _currencies[index];
                        final isSelected = item.code == selectedCode;
                        return InkWell(
                          onTap: () =>
                              Navigator.of(dialogContext).pop(item.code),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 14,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TypoTheme.bodyMedium_14(
                                    context,
                                    isSelected
                                        ? ColorsTheme.firstPrimary
                                        : ColorsTheme.neutralGreyLight,
                                    text: '${item.code} ( ${item.name} )',
                                  ),
                                ),
                                if (isSelected)
                                  SvgPicture.asset(
                                    AppVectors.tick,
                                    width: 18,
                                    height: 18,
                                    colorFilter: const ColorFilter.mode(
                                      ColorsTheme.firstPrimary,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CurrencyOption {
  final String code;
  final String name;

  const _CurrencyOption({required this.code, required this.name});
}
