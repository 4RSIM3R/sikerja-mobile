// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:next_starter/data/datasources/session/session_source.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/pages/auth/login_page.dart';
import 'package:next_starter/presentation/pages/home/home_page.dart';

import '../../common/extensions/extensions.dart';
import '../components/components.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const path = "/";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await 1.delayedSeconds;
    final user = await locator<SessionSource>().hasSession;
    if (user) {
      context.route.replace(HomePage.path);
      return;
    } else {
      context.route.replace(LoginPage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: BaseLogo()),
    );
  }
}
