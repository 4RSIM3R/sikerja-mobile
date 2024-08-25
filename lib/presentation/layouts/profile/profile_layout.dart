import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: ColorTheme.primary,
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              8.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nama Lengkap', style: CustomTextTheme.paragraph2),
                  4.verticalSpace,
                  Text('Jabatan Disini', style: CustomTextTheme.caption)
                ],
              )
            ],
          ),
          16.verticalSpace,
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            dense: true,
            leading: const Icon(CupertinoIcons.settings),
            title: const Text('Pengaturan'),
          ),
          Divider(color: Colors.grey[200]).py2(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            dense: true,
            leading: const Icon(CupertinoIcons.info),
            title: const Text('Tentang Aplikasi'),
          ),
          Divider(color: Colors.grey[200]).py2(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            dense: true,
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text('Logout'),
          ),
        ],
      ).p16().scrollVertical(),
    );
  }
}
