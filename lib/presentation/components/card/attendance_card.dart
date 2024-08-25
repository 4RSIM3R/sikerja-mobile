import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/theme/theme.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({
    super.key,
    required this.file,
    required this.onDelete,
  });

  final File file;
  final Function(XFile) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: ColorTheme.primary,
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: FileImage(file),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        file.path.split('/').last,
        style: CustomTextTheme.paragraph1,
        maxLines: 1,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text('${(file.lengthSync() / (1024 * 1024)).toStringAsFixed(2)} MB', style: CustomTextTheme.paragraph2),
      trailing: IconButton(
        onPressed: () {
          onDelete(XFile(file.path));
        },
        icon: const Icon(Icons.close),
      ),
    );
  }
}
