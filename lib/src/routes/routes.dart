import 'package:go_router/go_router.dart';
import 'package:kabarakmarket/src/domain/upload/upload_products.dart';
import 'package:kabarakmarket/src/featurea/auth/auth.dart';
import 'package:kabarakmarket/src/featurea/home_page.dart';
import 'package:kabarakmarket/src/featurea/onboarding/onboarding.dart';
import 'package:kabarakmarket/src/featurea/views/profile/widget/settings_screen.dart';
import 'package:kabarakmarket/src/featured/screens/apart_upload.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

@riverpod
route(RouteRef _) => _routes;

final _routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/verification',
      builder: (context, state) {
        final params = state.extra as VerificationPageParams?;

        if (params == null) {
          throw 'Missing `VerificationPageParams` object';
        }

        return VerificationPage(params: params);
      },
    ),
    GoRoute(
      path: '/upload',
      builder: (context, state) => const UploadProducts(),
    ),
    GoRoute(
      path: '/UploadApart',
      builder: (context, state) => const UploadApart(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);
