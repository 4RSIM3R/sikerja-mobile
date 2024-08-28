import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/button/primary_button.dart';
import 'package:next_starter/presentation/components/card/attendance_card.dart';
import 'package:next_starter/presentation/pages/activity/attendance/bloc/attendance_bloc.dart';
import 'package:next_starter/presentation/pages/activity/attendance/bloc/attendance_state.dart';
import 'package:next_starter/presentation/pages/home/home_page.dart';

class AttendancePage extends StatefulWidget {
  static const path = '/attendance';

  const AttendancePage({
    super.key,
    this.id,
    required this.report,
  });

  final dynamic id;
  final bool report;

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final picker = ImagePicker();
  List<XFile> files = [];

  final bloc = locator<AttendanceBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => bloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AttendanceBloc, AttendanceState>(
            listener: (context, state) {
              if (state is AttendanceLoadingState) {
                context.showLoadingIndicator();
              }

              if (state is AttendanceErrorState) {
                context.showSnackbar(message: state.message, error: true);
              }

              if (state is AttendanceSuccessState) {
                context.showSnackbar(message: 'Berhasil mengirim data');
                context.route.pushReplacement(HomePage.path);
              }
            },
          )
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Eviden'),
            actions: [
              IconButton(
                onPressed: () {
                  picker.pickImage(source: ImageSource.camera, imageQuality: 50).then((value) {
                    value != null ? setState(() => files.add(value)) : null;
                  });
                },
                icon: const Icon(CupertinoIcons.camera),
              ),
              IconButton(
                onPressed: () {
                  picker.pickImage(source: ImageSource.gallery, imageQuality: 50).then((value) {
                    value != null ? setState(() => files.add(value)) : null;
                  });
                },
                icon: const Icon(Icons.image),
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: files.isEmpty
                ? const Center(
                    child: Text('No files selected'),
                  )
                : Column(
                    children: files
                        .map(
                          (e) => AttendanceCard(
                            file: File(e.path),
                            onDelete: (file) {
                              setState(() {
                                files.removeWhere((e) => e.path == file.path);
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              title: 'Kirim',
              onTap: () {
                bloc.submit(id: widget.id, report: false, files: files);
              },
            ),
          ),
        ),
      ),
    );
  }
}
