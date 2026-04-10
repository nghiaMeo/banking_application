import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/core/theme/typo_theme.dart';
import 'package:bank_app/core/utils/app_navigation_bar.dart';
import 'package:bank_app/features/home/presentation/pages/home_tab_page.dart';
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
    _buildBottomTabPlaceholder(context, title: 'Search'),
    _buildBottomTabPlaceholder(context, title: 'Message'),
    _buildBottomTabPlaceholder(context, title: 'Setting'),
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

Widget _buildBottomTabPlaceholder(
  BuildContext context, {
  required String title,
}) {
  return Center(
    child: TypoTheme.titleSemiBold_24(
      context,
      ColorsTheme.firstPrimary,
      text: title,
    ),
  );
}
