import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/data/models/activity/activity_model.dart';
import 'package:next_starter/presentation/pages/activity/detail/activity_detail_page.dart';
import 'package:next_starter/presentation/theme/theme.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.model});

  final ActivityModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        context.route.pushNamed(ActivityDetailPage.path, extra: model);
      },
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: ColorTheme.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Icon(Icons.cases_outlined, color: ColorTheme.primary, size: 24),
        ),
      ),
      title: Text('${model.actionPlan}', style: CustomTextTheme.paragraph1.copyWith(fontWeight: FontWeight.w600)),
      subtitle: Text(DateFormat('dd MMMM yyyy').format(model.reportPeriodStart!)),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
