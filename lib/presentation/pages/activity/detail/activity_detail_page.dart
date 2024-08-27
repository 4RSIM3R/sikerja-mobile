import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_starter/common/utils/date_utils.dart';
import 'package:next_starter/data/models/activity/activity_model.dart';
import 'package:next_starter/presentation/theme/theme.dart';

class ActivityDetailPage extends StatefulWidget {
  const ActivityDetailPage({super.key, required this.model});

  static const path = "/activity/detail";

  final ActivityModel model;

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Detail Aktifitas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Periode Pelaporan', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
            Text(
              '${DateCommonUtils.countWeek(widget.model.reportPeriodStart!)}, ${DateCommonUtils.format(widget.model.reportPeriodStart!)} - ${DateCommonUtils.format(widget.model.reportPeriodEnd!)}',
              style: CustomTextTheme.paragraph1,
            ),
            8.verticalSpace,
            Text('Pelaksanaan Tugas', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
            Text('${widget.model.executionTask}', style: CustomTextTheme.paragraph1),
            8.verticalSpace,
            Text('Rencana Hasil Kerja', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
            Text('${widget.model.resultPlan}', style: CustomTextTheme.paragraph1),
            8.verticalSpace,
            Text('Rencana Aksi', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
            Text('${widget.model.actionPlan}', style: CustomTextTheme.paragraph1),
            8.verticalSpace,
            Text('Output', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
            Text('${widget.model.output}', style: CustomTextTheme.paragraph1),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.all(16),
      //   child: widget.model.attendances?.first.status == 'present'
      //       ? const SizedBox.shrink()
      //       : PrimaryButton(
      //           title: 'Tambahkan Eviden',
      //           onTap: () {
      //             context.route.push(
      //               AttendancePage.path,
      //               extra: {
      //                 'id': widget.model.id,
      //                 'report': true,
      //               },
      //             );
      //           },
      //         ),
      // ),
    );
  }
}
