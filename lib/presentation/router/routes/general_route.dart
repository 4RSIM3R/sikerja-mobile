import 'package:go_router/go_router.dart';
import 'package:next_starter/data/models/activity/activity_model.dart';
import 'package:next_starter/data/models/announcement/announcement_model.dart';
import 'package:next_starter/presentation/pages/about/about_page.dart';
import 'package:next_starter/presentation/pages/activity/attendance/attendance_page.dart';
import 'package:next_starter/presentation/pages/activity/detail/activity_detail_page.dart';
import 'package:next_starter/presentation/pages/activity/list/activity_list_page.dart';
import 'package:next_starter/presentation/pages/announcement/announcement_detail_page.dart';
import 'package:next_starter/presentation/pages/announcement/announcement_page.dart';
import 'package:next_starter/presentation/pages/assignment/assignment_page.dart';
import 'package:next_starter/presentation/pages/attendance/daily/daily_attendance_page.dart';
import 'package:next_starter/presentation/pages/attendance/history/history_attendance_page.dart';
import 'package:next_starter/presentation/pages/gallery/detail/gallery_detail_page.dart';
import 'package:next_starter/presentation/pages/gallery/list/gallery_list_page.dart';
import 'package:next_starter/presentation/pages/home/home_page.dart';

class GeneralRoute {
  static final routes = [
    GoRoute(
      path: HomePage.path,
      name: HomePage.path,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AboutPage.path,
      name: AboutPage.path,
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: ActivityListPage.path,
      name: ActivityListPage.path,
      builder: (context, state) => const ActivityListPage(),
    ),
    GoRoute(
      path: ActivityDetailPage.path,
      name: ActivityDetailPage.path,
      builder: (context, state) => ActivityDetailPage(model: state.extra as ActivityModel),
    ),
    GoRoute(
      path: AttendancePage.path,
      name: AttendancePage.path,
      builder: (context, state) => AttendancePage(
        id: (state.extra as Map<String, dynamic>)['id'] as int,
        report: (state.extra as Map<String, dynamic>)['report'] as bool,
      ),
    ),
    GoRoute(
      path: GalleryDetailPage.path,
      name: GalleryDetailPage.path,
      builder: (context, state) => GalleryDetailPage(
        images: (state.extra as Map<String, dynamic>)['images'] as List<String>,
      ),
    ),
    GoRoute(
      path: GalleryListPage.path,
      name: GalleryListPage.path,
      builder: (context, state) => const GalleryListPage(),
    ),
    GoRoute(
      path: AssignmentPage.path,
      name: AssignmentPage.path,
      builder: (context, state) => const AssignmentPage(),
    ),
    GoRoute(
      path: DailyAttendancePage.path,
      name: DailyAttendancePage.path,
      builder: (context, state) => const DailyAttendancePage(),
    ),
    GoRoute(
      path: HistoryAttendancePage.path,
      name: HistoryAttendancePage.path,
      builder: (context, state) => const HistoryAttendancePage(),
    ),
    GoRoute(
      path: AnnouncementPage.path,
      name: AnnouncementPage.path,
      builder: (context, state) => const AnnouncementPage(),
    ),
    GoRoute(
      path: AnnouncementDetailPage.path,
      name: AnnouncementDetailPage.path,
      builder: (context, state) => AnnouncementDetailPage(
        model: (state.extra as Map<String, dynamic>)['announcement'] as Announcement,
      ),
    ),
  ];
}
