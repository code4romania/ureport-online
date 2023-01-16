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
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:ureport_ecaro/view/screens/account/login-register/forgot_password.dart'
    as _i4;
import 'package:ureport_ecaro/view/screens/account/login-register/login.dart'
    as _i3;
import 'package:ureport_ecaro/view/screens/account/login-register/register.dart'
    as _i2;
import 'package:ureport_ecaro/view/screens/account/profile/about_view.dart'
    as _i5;
import 'package:ureport_ecaro/view/screens/account/profile/change_pw_view.dart'
    as _i6;
import 'package:ureport_ecaro/view/screens/account/profile/language_screen.dart'
    as _i7;
import 'package:ureport_ecaro/view/screens/account/profile/menu_view.dart'
    as _i8;
import 'package:ureport_ecaro/view/screens/account/profile/profile_view.dart'
    as _i9;
import 'package:ureport_ecaro/view/screens/onboarding/onboarding_screen.dart'
    as _i11;
import 'package:ureport_ecaro/view/screens/open_app/open_app_screen.dart'
    as _i10;
import 'package:ureport_ecaro/view/screens/splash_screen/splash_screen.dart'
    as _i1;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
        opaque: true,
      );
    },
    RegisterScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterScreen(),
        opaque: true,
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
        opaque: true,
      );
    },
    ForgotPasswordScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordScreen(),
        opaque: true,
      );
    },
    AboutScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.AboutScreen(),
        opaque: true,
      );
    },
    ChangePasswordScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.ChangePasswordScreen(),
        opaque: true,
      );
    },
    LanguageScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.LanguageScreen(),
        opaque: true,
      );
    },
    MenuScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.MenuScreen(),
        opaque: true,
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileScreen(),
        opaque: true,
      );
    },
    OpenAppScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.OpenAppScreen(),
        opaque: true,
      );
    },
    OnboardingScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.OnboardingScreen(),
        opaque: true,
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i12.RouteConfig(
          RegisterScreenRoute.name,
          path: '/register-screen',
        ),
        _i12.RouteConfig(
          LoginScreenRoute.name,
          path: '/login-screen',
        ),
        _i12.RouteConfig(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        ),
        _i12.RouteConfig(
          AboutScreenRoute.name,
          path: '/about-screen',
        ),
        _i12.RouteConfig(
          ChangePasswordScreenRoute.name,
          path: '/change-password-screen',
        ),
        _i12.RouteConfig(
          LanguageScreenRoute.name,
          path: '/language-screen',
        ),
        _i12.RouteConfig(
          MenuScreenRoute.name,
          path: '/menu-screen',
        ),
        _i12.RouteConfig(
          ProfileScreenRoute.name,
          path: '/profile-screen',
        ),
        _i12.RouteConfig(
          OpenAppScreenRoute.name,
          path: '/open-app-screen',
        ),
        _i12.RouteConfig(
          OnboardingScreenRoute.name,
          path: '/onboarding-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i12.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.RegisterScreen]
class RegisterScreenRoute extends _i12.PageRouteInfo<void> {
  const RegisterScreenRoute()
      : super(
          RegisterScreenRoute.name,
          path: '/register-screen',
        );

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i12.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i4.ForgotPasswordScreen]
class ForgotPasswordScreenRoute extends _i12.PageRouteInfo<void> {
  const ForgotPasswordScreenRoute()
      : super(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        );

  static const String name = 'ForgotPasswordScreenRoute';
}

/// generated route for
/// [_i5.AboutScreen]
class AboutScreenRoute extends _i12.PageRouteInfo<void> {
  const AboutScreenRoute()
      : super(
          AboutScreenRoute.name,
          path: '/about-screen',
        );

  static const String name = 'AboutScreenRoute';
}

/// generated route for
/// [_i6.ChangePasswordScreen]
class ChangePasswordScreenRoute extends _i12.PageRouteInfo<void> {
  const ChangePasswordScreenRoute()
      : super(
          ChangePasswordScreenRoute.name,
          path: '/change-password-screen',
        );

  static const String name = 'ChangePasswordScreenRoute';
}

/// generated route for
/// [_i7.LanguageScreen]
class LanguageScreenRoute extends _i12.PageRouteInfo<void> {
  const LanguageScreenRoute()
      : super(
          LanguageScreenRoute.name,
          path: '/language-screen',
        );

  static const String name = 'LanguageScreenRoute';
}

/// generated route for
/// [_i8.MenuScreen]
class MenuScreenRoute extends _i12.PageRouteInfo<void> {
  const MenuScreenRoute()
      : super(
          MenuScreenRoute.name,
          path: '/menu-screen',
        );

  static const String name = 'MenuScreenRoute';
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileScreenRoute extends _i12.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: '/profile-screen',
        );

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i10.OpenAppScreen]
class OpenAppScreenRoute extends _i12.PageRouteInfo<void> {
  const OpenAppScreenRoute()
      : super(
          OpenAppScreenRoute.name,
          path: '/open-app-screen',
        );

  static const String name = 'OpenAppScreenRoute';
}

/// generated route for
/// [_i11.OnboardingScreen]
class OnboardingScreenRoute extends _i12.PageRouteInfo<void> {
  const OnboardingScreenRoute()
      : super(
          OnboardingScreenRoute.name,
          path: '/onboarding-screen',
        );

  static const String name = 'OnboardingScreenRoute';
}
