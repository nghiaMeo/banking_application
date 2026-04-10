import 'package:flutter/material.dart';

Widget gridFeaturesWidget(BuildContext context) {
  final List<Map<String, Object>> items = const [
    {
      'icon': Icons.account_balance_wallet_outlined,
      'color': Color(0xFF3D3AB8),
      'label': 'Account\nand Card',
    },
    {
      'icon': Icons.compare_arrows_rounded,
      'color': Color(0xFFFF4E78),
      'label': 'Transfer',
    },
    {
      'icon': Icons.vertical_align_bottom_rounded,
      'color': Color(0xFF0D8BFF),
      'label': 'Withdraw',
    },
    {
      'icon': Icons.sim_card_download_outlined,
      'color': Color(0xFFFFAF2A),
      'label': 'Mobile\nprepaid',
    },
    {
      'icon': Icons.receipt_long_outlined,
      'color': Color(0xFF52D5BA),
      'label': 'Pay the\nbill',
    },
    {
      'icon': Icons.savings_outlined,
      'color': Color(0xFF5655B9),
      'label': 'Save\nonline',
    },
    {
      'icon': Icons.credit_card_rounded,
      'color': Color(0xFFFB6B18),
      'label': 'Credit\ncard',
    },
    {
      'icon': Icons.article_outlined,
      'color': Color(0xFF3D3AB8),
      'label': 'Transaction\nreport',
    },
    {
      'icon': Icons.perm_contact_calendar_outlined,
      'color': Color(0xFFFF4267),
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
      final icon = item['icon'] as IconData;
      final color = item['color'] as Color;
      final label = item['label'] as String;

      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFDFDFF),
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0C1E1E1E),
              blurRadius: 16,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 27),
            const SizedBox(height: 9),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF8A8A97),
                fontSize: 14,
                height: 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    },
  );
}