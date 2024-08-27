import 'package:flutter/material.dart';

const banners = [
  'https://awsimages.detik.net.id/community/media/visual/2023/07/15/menara-kujang-sepasang-di-sumedang-2_169.jpeg?w=1200',
  'https://i0.wp.com/www.anekatrip.com/wp-content/uploads/2018/03/sumedang.jpg',
  'https://sumedang.radarbandung.id/wp-content/uploads/sites/2/2023/02/al-kamil.jpg'
];

const workStartTime = TimeOfDay(hour: 7, minute: 30);

String checkIfLate(TimeOfDay workStartTime) {
  DateTime now = DateTime.now();
  DateTime workStartDateTime = DateTime(now.year, now.month, now.day, workStartTime.hour, workStartTime.minute);

  if (now.isAfter(workStartDateTime)) {
    Duration difference = now.difference(workStartDateTime);

    int hoursLate = difference.inHours;
    int minutesLate = difference.inMinutes.remainder(60);

    return 'Anda Telat $hoursLate Jam $minutesLate Menit';
  } else {
    return 'Anda Tidak Telat';
  }
}
