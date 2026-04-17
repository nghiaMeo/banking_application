import 'package:bank_app/features/home/presentation/pages/widgets/bank_card_widget.dart';
import 'package:bank_app/features/home/presentation/pages/widgets/grid_features_widget.dart';
import 'package:bank_app/features/home/presentation/pages/widgets/home_header_widget.dart';
import 'package:bank_app/features/transfer/presentation/pages/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors_theme.dart';
import '../../../../core/utils/app_navigator.dart';

class HomeTabPage extends ConsumerStatefulWidget {
  const HomeTabPage({super.key});

  @override
  ConsumerState<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends ConsumerState<HomeTabPage> {
  void _navigateTo(String route) {
    final routes = {'transfer': () => const TransferPage()};

    if (routes.containsKey(route)) {
      AppNavigator.push(context, routes[route]!());
    } else {
      throw Exception('Invalid route: $route');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 80,
              color: ColorsTheme.firstPrimary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: homeHeaderWidget(context),
              ),
            ),
            Container(
              width: double.infinity,
              color: ColorsTheme.firstPrimary,
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorsTheme.neutralWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 18),
                      bankCardWidget(context),
                      const SizedBox(height: 20),
                      gridFeaturesWidget(
                        context,
                        onTap: (route) => _navigateTo(route),
                      ),
                    ],
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
