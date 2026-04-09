import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_bar_custom.dart';
import 'package:bank_app/core/utils/app_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    _HomeTabContent(),
    _BottomTabPlaceholder(title: 'Search'),
    _BottomTabPlaceholder(title: 'Message'),
    _BottomTabPlaceholder(title: 'Setting'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}

class _BottomTabPlaceholder extends StatelessWidget {
  final String title;

  const _BottomTabPlaceholder({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TypoTheme.titleSemiBold_24(
        context,
        ColorsTheme.firstPrimary,
        text: title,
      ),
    );
  }
}

class _HomeTabContent extends StatelessWidget {
  const _HomeTabContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        titleAppBar: "Test",
        backGroundColor: ColorsTheme.firstPrimary,
        colorElement: Colors.white,
        fallBackWidget: const HomePage(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: ColorsTheme.firstPrimary,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _HomeHeader(),
                        const SizedBox(height: 18),
                        const _BankCardSection(),
                        const SizedBox(height: 20),
                        const _FeatureGrid(),
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
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 19,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
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
        Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
              size: 28,
            ),
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
      ],
    );
  }
}

class _BankCardSection extends StatelessWidget {
  const _BankCardSection();

  @override
  Widget build(BuildContext context) {
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
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [Color(0xFF221F8D), Color(0xFF247BFF)],
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
                    TypoTheme.titleSemiBold_24(
                      context,
                      Colors.white,
                      text: 'John Smith',
                    ),
                    const SizedBox(height: 18),
                    TypoTheme.captionSemibold_14(
                      context,
                      Colors.white,
                      text: 'Amazon Platinium',
                    ),
                    const SizedBox(height: 10),
                    TypoTheme.bodyMedium_16(
                      context,
                      Colors.white,
                      text: '4756   ••••   ••••   9018',
                    ),
                    const SizedBox(height: 4),
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
}

class _FeatureGrid extends StatelessWidget {
  const _FeatureGrid();

  @override
  Widget build(BuildContext context) {
    final List<_FeatureItem> items = const [
      _FeatureItem(
        icon: Icons.account_balance_wallet_outlined,
        color: Color(0xFF3D3AB8),
        label: 'Account\nand Card',
      ),
      _FeatureItem(
        icon: Icons.compare_arrows_rounded,
        color: Color(0xFFFF4E78),
        label: 'Transfer',
      ),
      _FeatureItem(
        icon: Icons.vertical_align_bottom_rounded,
        color: Color(0xFF0D8BFF),
        label: 'Withdraw',
      ),
      _FeatureItem(
        icon: Icons.sim_card_download_outlined,
        color: Color(0xFFFFAF2A),
        label: 'Mobile\nprepaid',
      ),
      _FeatureItem(
        icon: Icons.receipt_long_outlined,
        color: Color(0xFF52D5BA),
        label: 'Pay the\nbill',
      ),
      _FeatureItem(
        icon: Icons.savings_outlined,
        color: Color(0xFF5655B9),
        label: 'Save\nonline',
      ),
      _FeatureItem(
        icon: Icons.credit_card_rounded,
        color: Color(0xFFFB6B18),
        label: 'Credit\ncard',
      ),
      _FeatureItem(
        icon: Icons.article_outlined,
        color: Color(0xFF3D3AB8),
        label: 'Transaction\nreport',
      ),
      _FeatureItem(
        icon: Icons.perm_contact_calendar_outlined,
        color: Color(0xFFFF4267),
        label: 'Beneficiary',
      ),
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
              Icon(item.icon, color: item.color, size: 27),
              const SizedBox(height: 9),
              Text(
                item.label,
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
}

class _FeatureItem {
  final IconData icon;
  final Color color;
  final String label;

  const _FeatureItem({
    required this.icon,
    required this.color,
    required this.label,
  });
}
