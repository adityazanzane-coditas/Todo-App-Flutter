// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../../features/category/presentation/page/category_page.dart' as _i4;
import '../../../features/home/presentation/page/home_page.dart' as _i3;
import '../../../features/intro/presentation/page/onboarding_page.dart' as _i2;
import '../../../features/splash/splash_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    OnboardingScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.OnboardingScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.CategoryPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          OnboardingScreen.name,
          path: '/onboarding-screen',
        ),
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i5.RouteConfig(
          CategoryRoute.name,
          path: '/category-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingScreen extends _i5.PageRouteInfo<void> {
  const OnboardingScreen()
      : super(
          OnboardingScreen.name,
          path: '/onboarding-screen',
        );

  static const String name = 'OnboardingScreen';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.CategoryPage]
class CategoryRoute extends _i5.PageRouteInfo<void> {
  const CategoryRoute()
      : super(
          CategoryRoute.name,
          path: '/category-page',
        );

  static const String name = 'CategoryRoute';
}
