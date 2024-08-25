import 'package:go_router/go_router.dart';
import 'package:next_starter/presentation/pages/auth/login_page.dart';

class AuthRoute {
  static final routes = [
    GoRoute(
      path: LoginPage.path,
      name: LoginPage.path,
      builder: (context, state) => const LoginPage(),
    ),
  ];
}
