import 'package:bank_app/features/home/presentation/pages/home_page.dart';
import 'package:bank_app/features/interest/presentation/pages/interest_rate_page.dart';
import 'package:flutter/material.dart';


class AppRouter {
  static Widget get initialPage => const HomePage();
  static Widget get homePage => const HomePage();
  static Widget get interestRatePage => const InterestRatePage();

}
