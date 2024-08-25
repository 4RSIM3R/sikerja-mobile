import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/presentation/components/button/primary_button.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:one_clock/one_clock.dart';

class DailyAttendancePage extends StatefulWidget {
  const DailyAttendancePage({super.key});

  static const path = '/daily-attendance';

  @override
  State<DailyAttendancePage> createState() => _DailyAttendancePageState();
}

class _DailyAttendancePageState extends State<DailyAttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Absensi Harian'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Anda Telat 2 Jam 53 Menit',
              style: CustomTextTheme.paragraph3.copyWith(fontWeight: FontWeight.w600),
            ).center(),
            32.verticalSpace,
            AnalogClock(
              width: MediaQuery.sizeOf(context).width * 0.65,
              height: MediaQuery.sizeOf(context).width * 0.65,
              isLive: true,
              datetime: DateTime.now(),
              showAllNumbers: true,
              showDigitalClock: true,
              showNumbers: true,
              showTicks: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          title: 'Check In',
          onTap: () {},
        ),
      ),
    );
  }
}
