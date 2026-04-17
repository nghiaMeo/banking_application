import 'package:bank_app/core/asset/vectors/app_vectors.dart';
import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../auth/presentation/widgets/input_field_widget.dart';

class TransferPage extends ConsumerStatefulWidget {
  const TransferPage({super.key});

  @override
  ConsumerState<TransferPage> createState() => _TransferPageState();
}

enum _TransferType { cardNumber, sameBank, otherBank }

class _Beneficiary {
  final String name;
  final String? subtitle;
  const _Beneficiary(this.name, {this.subtitle});
}

class _TransferPageState extends ConsumerState<TransferPage> {
  final _nameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _amountController = TextEditingController();
  final _contentController = TextEditingController();

  _TransferType? _selectedTransferType = _TransferType.cardNumber;
  int _selectedBeneficiaryIndex = 1;
  bool _saveBeneficiary = false;

  String? _selectedAccount;

  final _beneficiaries = const <_Beneficiary>[
    _Beneficiary('Add', subtitle: null),
    _Beneficiary('Emma'),
    _Beneficiary('Justin'),
    _Beneficiary('Amanda'),
    _Beneficiary('Amanda'),
    _Beneficiary('Amanda'),
    _Beneficiary('Amanda'),
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _cardNumberController.dispose();
    _amountController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  bool get _canConfirm {
    return _selectedTransferType != null &&
        _nameController.text.trim().isNotEmpty &&
        _cardNumberController.text.trim().isNotEmpty &&
        _amountController.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(
        titleAppBar: 'Transfer',
        colorElement: ColorsTheme.neutralGreyDeep,
        backGroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _accountPicker(context),
                        const SizedBox(height: 18),
                        _sectionLabel(context, 'Choose transaction'),
                        const SizedBox(height: 10),
                        _transferTypeRow(context),
                        const SizedBox(height: 18),
                        _beneficiaryHeader(context),
                        const SizedBox(height: 12),
                        _beneficiaryRow(context),
                        const SizedBox(height: 18),
                        inputFieldWidget(
                          context,
                          hint: 'Name',
                          controller: _nameController,
                        ),
                        const SizedBox(height: 12),
                        inputFieldWidget(
                          context,
                          hint: 'Card number',
                          controller: _cardNumberController,
                        ),
                        const SizedBox(height: 12),
                        inputFieldWidget(
                          context,
                          hint: 'Amount',
                          controller: _amountController,
                        ),
                        const SizedBox(height: 12),
                        inputFieldWidget(
                          context,
                          hint: 'Content',
                          controller: _contentController,
                        ),
                        const SizedBox(height: 12),
                        _saveBeneficiaryRow(context),
                        const SizedBox(height: 16),
                        _confirmButton(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(BuildContext context, String text) {
    return TypoTheme.captionSemibold_14(
      context,
      ColorsTheme.neutralGreyMid,
      text: text,
    );
  }

  Widget _accountPicker(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final selected = await showModalBottomSheet<String>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (ctx) {
            final items = const <String>[
              'Choose account / card',
              'Account •••• 1122',
              'Card •••• 9876',
            ];
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TypoTheme.titleSemiBold_16(
                      ctx,
                      ColorsTheme.neutralGreyDeep,
                      text: 'Select',
                    ),
                    const SizedBox(height: 10),
                    ...items.map(
                      (e) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: TypoTheme.bodyMedium_14(
                          ctx,
                          ColorsTheme.neutralGreyDeep,
                          text: e,
                        ),
                        onTap: () => Navigator.pop(ctx, e),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );

        if (!mounted) return;
        if (selected != null) {
          setState(() {
            _selectedAccount =
                selected == 'Choose account / card' ? null : selected;
          });
        }
      },
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: ColorsTheme.neutralWhileLight,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: ColorsTheme.neutralVani),
        ),
        child: Row(
          children: [
            Expanded(
              child: TypoTheme.bodyMedium_14(
                context,
                _selectedAccount == null
                    ? ColorsTheme.neutralWhiteGrey
                    : ColorsTheme.neutralGreyDeep,
                text: _selectedAccount ?? 'Choose account / card',
              ),
            ),
            SvgPicture.asset(
              AppVectors.downSmall,
              height: 16,
              width: 16,
              color: ColorsTheme.neutralGreyMid,
            ),
          ],
        ),
      ),
    );
  }

  Widget _transferTypeRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _transferTypeCard(
            context,
            type: _TransferType.cardNumber,
            icon: AppVectors.creditCard,
            label: 'Transfer via\ncard number',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _transferTypeCard(
            context,
            type: _TransferType.sameBank,
            icon: AppVectors.user,
            label: 'Transfer to the same bank',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _transferTypeCard(
            context,
            type: _TransferType.otherBank,
            icon: AppVectors.bank,
            label: 'Transfer to other bank',
          ),
        ),
      ],
    );
  }

  Widget _transferTypeCard(
    BuildContext context, {
    required _TransferType type,
    required String icon,
    required String label,
  }) {
    final selected = _selectedTransferType == type;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        setState(() {
          _selectedTransferType = type;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        height: 100,
        decoration: BoxDecoration(
          color: selected ? ColorsTheme.fourthPrimary : ColorsTheme.neutralWhileLight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? ColorsTheme.firstPrimary : ColorsTheme.neutralVani,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              icon,
              height: 20,
              width: 20,
              color: selected ? ColorsTheme.firstPrimary : ColorsTheme.neutralGreyMid,
            ),
            const Spacer(),
            TypoTheme.bodyMedium_12(
              context,
              ColorsTheme.neutralGreyDeep,
              text: label,
            ),
          ],
        ),
      ),
    );
  }

  Widget _beneficiaryHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _sectionLabel(context, 'Choose beneficiary'),
        ),
        InkWell(
          onTap: () {
            // Placeholder: bạn có thể điều hướng sang màn tìm kiếm beneficiary sau.
          },
          child: TypoTheme.captionSemibold_14(
            context,
            ColorsTheme.firstPrimary,
            text: 'Find beneficiary',
          ),
        ),
      ],
    );
  }

  Widget _beneficiaryRow(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _beneficiaries.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (ctx, index) {
          final b = _beneficiaries[index];
          final selected = _selectedBeneficiaryIndex == index;
          final isAdd = index == 0;

          return InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () {
              setState(() {
                _selectedBeneficiaryIndex = index;
                if (!isAdd) {
                  _nameController.text = b.name;
                } else {
                  _nameController.clear();
                  _cardNumberController.clear();
                }
              });
            },
            child: Container(
              width: 90,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                color: ColorsTheme.neutralWhileLight,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: selected ? ColorsTheme.firstPrimary : ColorsTheme.neutralVani,
                ),
              ),
              child: Column(
                children: [
                  _beneficiaryAvatar(context, index, selected: selected),
                  const SizedBox(height: 6),
                  TypoTheme.bodyMedium_12(
                    context,
                    ColorsTheme.neutralGreyDeep,
                    text: isAdd ? '' : b.name,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _beneficiaryAvatar(
    BuildContext context,
    int index, {
    required bool selected,
  }) {
    final isAdd = index == 0;
    if (isAdd) {
      return Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          color: ColorsTheme.fourthPrimary,
          shape: BoxShape.circle,
          border: Border.all(color: ColorsTheme.neutralVani),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppVectors.plus,
            height: 18,
            width: 18,
            color: ColorsTheme.firstPrimary,
          ),
        ),
      );
    }

    final name = _beneficiaries[index].name;
    final initial = name.isNotEmpty ? name.characters.first.toUpperCase() : '?';
    return Stack(
      children: [
        CircleAvatar(
          radius: 21,
          backgroundColor: ColorsTheme.thirdPrimary.withOpacity(0.25),
          child: TypoTheme.titleSemiBold_16(
            context,
            ColorsTheme.firstPrimary,
            text: initial,
            textAlign: TextAlign.center,
          ),
        ),
        if (selected)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: ColorsTheme.firstPrimary,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppVectors.tick,
                  height: 10,
                  width: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _saveBeneficiaryRow(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _saveBeneficiary = !_saveBeneficiary;
        });
      },
      child: Row(
        children: [
          Checkbox(
            value: _saveBeneficiary,
            onChanged: (v) {
              setState(() {
                _saveBeneficiary = v ?? false;
              });
            },
            activeColor: ColorsTheme.firstPrimary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          Expanded(
            child: TypoTheme.bodyMedium_14(
              context,
              ColorsTheme.neutralGreyMid,
              text: 'Save to directory of beneficiary',
            ),
          ),
        ],
      ),
    );
  }

  Widget _confirmButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: _canConfirm
            ? () {
                FocusScope.of(context).unfocus();
                // TODO: hook API / state management later.
              }
            : null,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: _canConfirm
              ? ColorsTheme.firstPrimary
              : ColorsTheme.fourthPrimary,
          disabledBackgroundColor: ColorsTheme.fourthPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        child: TypoTheme.titleSemiBold_16(
          context,
          _canConfirm ? ColorsTheme.neutralWhite : ColorsTheme.neutralWhiteGrey,
          text: 'Confirm',
        ),
      ),
    );
  }
}
