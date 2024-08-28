import 'package:flutter/material.dart';
import 'package:next_starter/common/extensions/context_extension.dart';
import 'package:next_starter/data/models/assignment/assignment_model.dart';
import 'package:next_starter/presentation/pages/viewer/pdf_viewer_page.dart';
import 'package:next_starter/presentation/theme/theme.dart';

class AssignmentCard extends StatelessWidget {
  const AssignmentCard({
    super.key,
    required this.model,
  });

  final Assignment model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
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
      subtitle: Text('${model.number}'),
      trailing: IconButton(
        onPressed: () {
          context.route.pushNamed(PdfViewerPage.path);
        },
        icon: const Icon(Icons.download),
      ),
    );
  }
}
