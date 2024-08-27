import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:next_starter/common/constant/ui_constant.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/button/primary_button.dart';
import 'package:next_starter/presentation/pages/attendance/daily/bloc/daily_attendance_bloc.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:one_clock/one_clock.dart';

class DailyAttendancePage extends StatefulWidget {
  const DailyAttendancePage({super.key});

  static const path = '/daily-attendance';

  @override
  State<DailyAttendancePage> createState() => _DailyAttendancePageState();
}

class _DailyAttendancePageState extends State<DailyAttendancePage> {

  final bloc = locator<DailyAttendanceBloc>();

  Position? position;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

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
              checkIfLate(workStartTime),
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
          onTap: () async {
            var image = await picker.pickImage(source: ImageSource.gallery);
            if (image != null && position != null) {
              bloc.submit(path: image.path, position: position!);
            }
          },
        ),
      ),
    );
  }
}
