import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_starter/application/auth/auth_cubit.dart';
import 'package:next_starter/common/extensions/context_extension.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/card/activity_card.dart';
import 'package:next_starter/presentation/pages/about/about_page.dart';
import 'package:next_starter/presentation/pages/activity/list/activity_list_page.dart';
import 'package:next_starter/presentation/pages/activity/list/bloc/activity_list_bloc.dart';
import 'package:next_starter/presentation/pages/assignment/assignment_page.dart';
import 'package:next_starter/presentation/pages/gallery/list/gallery_list_page.dart';
import 'package:next_starter/presentation/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const path = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final auth = locator<AuthCubit>();
  final activity = locator<ActivityListBloc>();

  @override
  void initState() {
    super.initState();
    activity.add(ActivityListFetch());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => auth),
        BlocProvider(create: (_) => activity),
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
                  items: List.generate(
                    4,
                    (i) => Container(
                      height: 185,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://static.promediateknologi.id/crop/0x0:0x0/550x500/webp/photo/2023/01/09/2437041174.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
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
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: ColorTheme.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(CupertinoIcons.list_bullet, color: ColorTheme.primary, size: 32),
                            ),
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Aktifitas',
                          style: CustomTextTheme.paragraph1.copyWith(),
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
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: ColorTheme.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(CupertinoIcons.doc, color: ColorTheme.primary, size: 32),
                            ),
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Surat Tugas',
                          style: CustomTextTheme.paragraph1.copyWith(),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            context.route.push(AboutPage.path);
                          },
                          child: Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: ColorTheme.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(CupertinoIcons.pencil_circle, color: ColorTheme.primary, size: 32),
                            ),
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Absensi',
                          style: CustomTextTheme.paragraph1.copyWith(),
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
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: ColorTheme.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(CupertinoIcons.photo, color: ColorTheme.primary, size: 32),
                            ),
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Galeri',
                          style: CustomTextTheme.paragraph1.copyWith(),
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
                    Text('Kegiatan', style: CustomTextTheme.paragraph2.copyWith(color: Colors.black)),
                    Text('Lihat Semua', style: CustomTextTheme.paragraph1.copyWith(color: Colors.blue)),
                  ],
                ),
                BlocBuilder<ActivityListBloc, ActivityListState>(
                  builder: (context, state) {
                    if (state.status == ActivityListStatus.success) {
                      return Column(
                        children: [
                          ...state.posts.take(3).map((e) => ActivityCard(model: e)),
                        ],
                      );
                    }
                    return const Center(child: CircularProgressIndicator.adaptive());
                  },
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Berita', style: CustomTextTheme.paragraph2.copyWith(color: Colors.black)),
                    Text('Lihat Semua', style: CustomTextTheme.paragraph1.copyWith(color: Colors.blue)),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
