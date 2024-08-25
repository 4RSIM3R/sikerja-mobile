// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:next_starter/presentation/pages/attendance/daily/daily_attendance_page.dart';

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
    // final user = await locator<SessionSource>().hasSession;
    // if (user) {
    //   context.route.replace(HomePage.path);
    //   return;
    // }
    context.route.replace(DailyAttendancePage.path);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: BaseLogo()),
    );
  }
}
