import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_starter/application/auth/auth_cubit.dart';
import 'package:next_starter/common/constant/ui_constant.dart';
import 'package:next_starter/common/extensions/context_extension.dart';
import 'package:next_starter/common/widgets/app_error_widget.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/card/announcement_card.dart';
import 'package:next_starter/presentation/components/card/assignment_card.dart';
import 'package:next_starter/presentation/pages/activity/list/activity_list_page.dart';
import 'package:next_starter/presentation/pages/activity/list/bloc/activity_list_bloc.dart';
import 'package:next_starter/presentation/pages/announcement/announcement_page.dart';
import 'package:next_starter/presentation/pages/announcement/bloc/announcement_bloc.dart';
import 'package:next_starter/presentation/pages/assignment/assignment_page.dart';
import 'package:next_starter/presentation/pages/assignment/bloc/assignment_bloc.dart';
import 'package:next_starter/presentation/pages/attendance/daily/daily_attendance_page.dart';
import 'package:next_starter/presentation/pages/gallery/list/gallery_list_page.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const path = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final auth = locator<AuthCubit>();
  final activity = locator<ActivityListBloc>();
  final announcement = locator<AnnouncementBloc>();
  final assignment = locator<AssignmentBloc>();

  @override
  void initState() {
    super.initState();
    requestPermission();
    fetch();
  }

  Future<void> fetch() async {
    activity.add(ActivityListFetch());
    announcement.add(AnnouncementFetch());
    assignment.add(AssignmentFetch());
  }

  Future<void> requestPermission() async {
    await [
      Permission.location,
      Permission.camera,
      Permission.storage,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => auth),
        BlocProvider(create: (_) => activity),
        BlocProvider(create: (_) => announcement),
        BlocProvider(create: (_) => assignment),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                context.showLoadingIndicator();
              } else if (state is AuthError) {
                context.showSnackbar(message: state.message, error: true);
              } else if (state is AuthSuccess) {
                context.showSnackbar(message: state.message);
                context.route.pushReplacement(HomePage.path);
              }
            },
          )
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            title: const Text('Beranda'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.info),
              ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            child: Column(
              children: [
                DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(color: ColorTheme.primary),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SIKERJA DINKES SUMEDANG',
                          style: CustomTextTheme.paragraph2.copyWith(color: Colors.white),
                        ),
                        Text(
                          'versi 1.0.0',
                          style: CustomTextTheme.paragraph1.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                ListTile(
                  leading: const Icon(Icons.exit_to_app, color: Colors.red),
                  title: Text('Logout', style: CustomTextTheme.paragraph1.copyWith(color: Colors.red)),
                  onTap: () {
                    auth.logout();
                  },
                ),
                16.verticalSpace,
              ],
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: 185,
                      viewportFraction: 0.85,
                      enableInfiniteScroll: true,
                      initialPage: 0,
                      enlargeCenterPage: true),
                  items: banners
                      .map((e) => Container(
                            height: 185,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(e),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            context.route.push(ActivityListPage.path);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: ColorTheme.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(CupertinoIcons.list_bullet, color: ColorTheme.primary, size: 28),
                            ),
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Aktifitas',
                          style: CustomTextTheme.paragraph1.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            context.route.push(AssignmentPage.path);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: ColorTheme.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(CupertinoIcons.doc, color: ColorTheme.primary, size: 28),
                            ),
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Surat Tugas',
                          style: CustomTextTheme.paragraph1.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            context.route.push(DailyAttendancePage.path);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: ColorTheme.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(CupertinoIcons.pencil_circle, color: ColorTheme.primary, size: 28),
                            ),
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Absensi',
                          style: CustomTextTheme.paragraph1.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            context.route.push(GalleryListPage.path);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: ColorTheme.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(CupertinoIcons.photo, color: ColorTheme.primary, size: 28),
                            ),
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Galeri',
                          style: CustomTextTheme.paragraph1.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Surat Tugas', style: CustomTextTheme.paragraph2.copyWith(color: Colors.black)),
                    InkWell(
                      onTap: () {
                        context.route.push(AssignmentPage.path);
                      },
                      child: Text(
                        'Lihat Semua',
                        style: CustomTextTheme.paragraph1.copyWith(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<AssignmentBloc, AssignmentState>(
                  builder: (context, state) {
                    if (state.status == AssignmentStatus.success) {
                      return Column(
                        children: [
                          ...state.assignments.take(3).map((e) => AssignmentCard(model: e)),
                        ],
                      );
                    } else if (state.status == AssignmentStatus.failure) {
                      return AppErrorWidget(message: state.errorMessage);
                    } else {
                      return const Column(
                        children: [
                          Text('shimmer...'),
                        ],
                      );
                    }
                  },
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Berita', style: CustomTextTheme.paragraph2.copyWith(color: Colors.black)),
                    InkWell(
                      onTap: () {
                        context.route.push(AnnouncementPage.path);
                      },
                      child: Text(
                        'Lihat Semua',
                        style: CustomTextTheme.paragraph1.copyWith(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<AnnouncementBloc, AnnouncementState>(
                  builder: (context, state) {
                    if (state.status == AnnouncementStatus.success) {
                      return Column(
                        children: [
                          ...state.announcements.take(3).map((e) => AnnouncementCard(model: e)),
                        ],
                      );
                    } else if (state.status == AnnouncementStatus.failure) {
                      return AppErrorWidget(message: state.errorMessage);
                    } else {
                      return const Column(
                        children: [
                          Text('shimmer...'),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
