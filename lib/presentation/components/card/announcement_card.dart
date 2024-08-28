import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/common/extensions/context_extension.dart';
import 'package:next_starter/data/models/announcement/announcement_model.dart';
import 'package:next_starter/presentation/pages/announcement/announcement_detail_page.dart';
import 'package:next_starter/presentation/theme/theme.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({
    super.key,
    required this.model,
  });

  final Announcement model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        context.route.pushNamed(AnnouncementDetailPage.path, extra: model);
      },
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: ColorTheme.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Icon(Icons.newspaper, color: ColorTheme.primary, size: 24),
        ),
      ),
      title: Text('${model.title}', style: CustomTextTheme.paragraph1.copyWith(fontWeight: FontWeight.w600)),
      subtitle: Text(DateFormat('dd MMMM yyyy').format(model.createdAt!)),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
