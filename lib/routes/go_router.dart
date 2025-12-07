import 'package:go_router/go_router.dart' as go_router;
import '../screens/home_screen.dart';
import '../screens/home_subroute1.dart';
import '../screens/home_subroute2.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../widgets/app_shell.dart';

class GoRouter {
  static final GoRouter _instance = GoRouter._internal();
  factory GoRouter() => _instance;
  GoRouter._internal();

  static go_router.GoRouter? _routerInstance;

  static go_router.GoRouter get router {
    _routerInstance ??= go_router.GoRouter(
      initialLocation: '/home',
      routes: <go_router.RouteBase>[
        go_router.StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return AppShell(navigationShell: navigationShell);
          },
          branches: <go_router.StatefulShellBranch>[
            // Home Tab Branch
            go_router.StatefulShellBranch(
              routes: <go_router.RouteBase>[
                go_router.GoRoute(
                  path: '/home',
                  builder: (context, state) => const HomeScreen(),
                  routes: <go_router.GoRoute>[
                    go_router.GoRoute(
                      path: 'subroute1',
                      builder: (context, state) => const HomeSubRoute1(),
                    ),
                    go_router.GoRoute(
                      path: 'subroute2',
                      builder: (context, state) => const HomeSubRoute2(),
                    ),
                  ],
                ),
              ],
            ),
            // Profile Tab Branch
            go_router.StatefulShellBranch(
              routes: <go_router.RouteBase>[
                go_router.GoRoute(
                  path: '/profile',
                  builder: (context, state) => const ProfileScreen(),
                  routes: <go_router.GoRoute>[
                    go_router.GoRoute(
                      path: 'settings',
                      builder: (context, state) => const SettingsScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
    return _routerInstance!;
  }
}
