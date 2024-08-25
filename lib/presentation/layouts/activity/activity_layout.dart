import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_starter/presentation/components/view/calendar_view.dart';
import 'package:velocity_x/velocity_x.dart';

class ActivityLayout extends StatefulWidget {
  const ActivityLayout({super.key});

  @override
  State<ActivityLayout> createState() => _ActivityLayoutState();
}

class _ActivityLayoutState extends State<ActivityLayout> {
  var selected = DateTime.now();
  final controller = ValueNotifier<PageController?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Aktivitas'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          )
        ],
      ),
      body: Column(
        children: [
          CalendarView(
            firstDate: DateTime.now().subtract(const Duration(days: 365 * 3)),
            lastDate: DateTime.now(),
            selectedDate: selected,
            controller: controller.value,
            onDateChanged: (day) {},
            onPageChanged: (day) {},
            onCalendarCreated: (pController) {},
            highlights: const [],
          ),
          16.verticalSpace,
          
        ],
      ).p16().scrollVertical(),
    );
  }
}
