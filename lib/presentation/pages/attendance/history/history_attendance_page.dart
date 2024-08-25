import 'package:flutter/material.dart';

class HistoryAttendancePage extends StatefulWidget {
  const HistoryAttendancePage({super.key});

  static const path = '/history-attendance';

  @override
  State<HistoryAttendancePage> createState() => _HistoryAttendancePageState();
}

class _HistoryAttendancePageState extends State<HistoryAttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Riwayat Absensi'),
      ),
      body: const Center(
        child: Text('Riwayat Absensi'),
      ),
    );
  }
}