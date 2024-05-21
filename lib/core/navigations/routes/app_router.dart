import 'package:auto_route/auto_route.dart';
import 'package:todo_app/features/category/presentation/page/category_page.dart';
import 'package:todo_app/features/intro/presentation/page/onboarding_page.dart';
import 'package:todo_app/features/home/presentation/page/home_page.dart';
import 'package:todo_app/features/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: OnboardingScreen),
    AutoRoute(page: HomePage),
    AutoRoute(page: CategoryPage),
  ],
)
class $AppRouter {}
