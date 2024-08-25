import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class DocumentLayout extends StatelessWidget {
  const DocumentLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dokumen'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.info),
          )
        ],
      ),
      body: Column(
        children: [
          Text('Rekap Absensi', style: CustomTextTheme.paragraph1),
        ],
      ).p16().scrollVertical(),
    );
  }
}
