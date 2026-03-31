import 'package:bank_app/utilis/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarCustom("Sign in"),
      body: SafeArea(child: Column(

      )),
    );
  }

}

