import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_navigation_bar.dart';
import 'package:bank_app/features/home/presentation/pages/home_tab_page.dart';
import 'package:bank_app/features/home/presentation/pages/search_tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  late final List<Widget> _pages = [
    HomeTabPage(),
    SearchTabPage(onBack: () => setState(() => _currentIndex = 0)),
    _PlaceholderTab(title: 'Message'),
    _PlaceholderTab(title: 'Setting'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.neutralWhite,
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

class _PlaceholderTab extends StatelessWidget {
  const _PlaceholderTab({required this.title});

  final String title;

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
