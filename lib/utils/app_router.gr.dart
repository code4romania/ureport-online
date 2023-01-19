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
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
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
import 'package:ureport_ecaro/view/screens/articles/article/article_screen.dart'
    as _i14;
import 'package:ureport_ecaro/view/screens/articles/article/articles_list_screen.dart'
    as _i13;
import 'package:ureport_ecaro/view/screens/articles/article/model/story.dart'
    as _i17;
import 'package:ureport_ecaro/view/screens/articles/categories/category_list.dart'
    as _i12;
import 'package:ureport_ecaro/view/screens/onboarding/onboarding_screen.dart'
    as _i11;
import 'package:ureport_ecaro/view/screens/open_app/open_app_screen.dart'
    as _i10;
import 'package:ureport_ecaro/view/screens/splash_screen/splash_screen.dart'
    as _i1;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
        opaque: true,
      );
    },
    RegisterScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterScreen(),
        opaque: true,
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
        opaque: true,
      );
    },
    ForgotPasswordScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordScreen(),
        opaque: true,
      );
    },
    AboutScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.AboutScreen(),
        opaque: true,
      );
    },
    ChangePasswordScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.ChangePasswordScreen(),
        opaque: true,
      );
    },
    LanguageScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.LanguageScreen(),
        opaque: true,
      );
    },
    MenuScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.MenuScreen(),
        opaque: true,
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileScreen(),
        opaque: true,
      );
    },
    OpenAppScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.OpenAppScreen(),
        opaque: true,
      );
    },
    OnboardingScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.OnboardingScreen(),
        opaque: true,
      );
    },
    CategoryListScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i12.CategoryListScreen(),
        opaque: true,
      );
    },
    ArticlesListScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ArticlesListScreenRouteArgs>();
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i13.ArticlesListScreen(
          args.key,
          args.categoryImg,
          args.categoryTitle,
        ),
        opaque: true,
      );
    },
    ArticleScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleScreenRouteArgs>();
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i14.ArticleScreen(
          key: args.key,
          article: args.article,
        ),
        opaque: true,
      );
    },
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i15.RouteConfig(
          RegisterScreenRoute.name,
          path: '/register-screen',
        ),
        _i15.RouteConfig(
          LoginScreenRoute.name,
          path: '/login-screen',
        ),
        _i15.RouteConfig(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        ),
        _i15.RouteConfig(
          AboutScreenRoute.name,
          path: '/about-screen',
        ),
        _i15.RouteConfig(
          ChangePasswordScreenRoute.name,
          path: '/change-password-screen',
        ),
        _i15.RouteConfig(
          LanguageScreenRoute.name,
          path: '/language-screen',
        ),
        _i15.RouteConfig(
          MenuScreenRoute.name,
          path: '/menu-screen',
        ),
        _i15.RouteConfig(
          ProfileScreenRoute.name,
          path: '/profile-screen',
        ),
        _i15.RouteConfig(
          OpenAppScreenRoute.name,
          path: '/open-app-screen',
        ),
        _i15.RouteConfig(
          OnboardingScreenRoute.name,
          path: '/onboarding-screen',
        ),
        _i15.RouteConfig(
          CategoryListScreenRoute.name,
          path: '/category-list-screen',
        ),
        _i15.RouteConfig(
          ArticlesListScreenRoute.name,
          path: '/articles-list-screen',
        ),
        _i15.RouteConfig(
          ArticleScreenRoute.name,
          path: '/article-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i15.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.RegisterScreen]
class RegisterScreenRoute extends _i15.PageRouteInfo<void> {
  const RegisterScreenRoute()
      : super(
          RegisterScreenRoute.name,
          path: '/register-screen',
        );

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i15.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i4.ForgotPasswordScreen]
class ForgotPasswordScreenRoute extends _i15.PageRouteInfo<void> {
  const ForgotPasswordScreenRoute()
      : super(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        );

  static const String name = 'ForgotPasswordScreenRoute';
}

/// generated route for
/// [_i5.AboutScreen]
class AboutScreenRoute extends _i15.PageRouteInfo<void> {
  const AboutScreenRoute()
      : super(
          AboutScreenRoute.name,
          path: '/about-screen',
        );

  static const String name = 'AboutScreenRoute';
}

/// generated route for
/// [_i6.ChangePasswordScreen]
class ChangePasswordScreenRoute extends _i15.PageRouteInfo<void> {
  const ChangePasswordScreenRoute()
      : super(
          ChangePasswordScreenRoute.name,
          path: '/change-password-screen',
        );

  static const String name = 'ChangePasswordScreenRoute';
}

/// generated route for
/// [_i7.LanguageScreen]
class LanguageScreenRoute extends _i15.PageRouteInfo<void> {
  const LanguageScreenRoute()
      : super(
          LanguageScreenRoute.name,
          path: '/language-screen',
        );

  static const String name = 'LanguageScreenRoute';
}

/// generated route for
/// [_i8.MenuScreen]
class MenuScreenRoute extends _i15.PageRouteInfo<void> {
  const MenuScreenRoute()
      : super(
          MenuScreenRoute.name,
          path: '/menu-screen',
        );

  static const String name = 'MenuScreenRoute';
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileScreenRoute extends _i15.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: '/profile-screen',
        );

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i10.OpenAppScreen]
class OpenAppScreenRoute extends _i15.PageRouteInfo<void> {
  const OpenAppScreenRoute()
      : super(
          OpenAppScreenRoute.name,
          path: '/open-app-screen',
        );

  static const String name = 'OpenAppScreenRoute';
}

/// generated route for
/// [_i11.OnboardingScreen]
class OnboardingScreenRoute extends _i15.PageRouteInfo<void> {
  const OnboardingScreenRoute()
      : super(
          OnboardingScreenRoute.name,
          path: '/onboarding-screen',
        );

  static const String name = 'OnboardingScreenRoute';
}

/// generated route for
/// [_i12.CategoryListScreen]
class CategoryListScreenRoute extends _i15.PageRouteInfo<void> {
  const CategoryListScreenRoute()
      : super(
          CategoryListScreenRoute.name,
          path: '/category-list-screen',
        );

  static const String name = 'CategoryListScreenRoute';
}

/// generated route for
/// [_i13.ArticlesListScreen]
class ArticlesListScreenRoute
    extends _i15.PageRouteInfo<ArticlesListScreenRouteArgs> {
  ArticlesListScreenRoute({
    required _i16.Key? key,
    required String categoryImg,
    required String categoryTitle,
  }) : super(
          ArticlesListScreenRoute.name,
          path: '/articles-list-screen',
          args: ArticlesListScreenRouteArgs(
            key: key,
            categoryImg: categoryImg,
            categoryTitle: categoryTitle,
          ),
        );

  static const String name = 'ArticlesListScreenRoute';
}

class ArticlesListScreenRouteArgs {
  const ArticlesListScreenRouteArgs({
    required this.key,
    required this.categoryImg,
    required this.categoryTitle,
  });

  final _i16.Key? key;

  final String categoryImg;

  final String categoryTitle;

  @override
  String toString() {
    return 'ArticlesListScreenRouteArgs{key: $key, categoryImg: $categoryImg, categoryTitle: $categoryTitle}';
  }
}

/// generated route for
/// [_i14.ArticleScreen]
class ArticleScreenRoute extends _i15.PageRouteInfo<ArticleScreenRouteArgs> {
  ArticleScreenRoute({
    _i16.Key? key,
    required _i17.Result article,
  }) : super(
          ArticleScreenRoute.name,
          path: '/article-screen',
          args: ArticleScreenRouteArgs(
            key: key,
            article: article,
          ),
        );

  static const String name = 'ArticleScreenRoute';
}

class ArticleScreenRouteArgs {
  const ArticleScreenRouteArgs({
    this.key,
    required this.article,
  });

  final _i16.Key? key;

  final _i17.Result article;

  @override
  String toString() {
    return 'ArticleScreenRouteArgs{key: $key, article: $article}';
  }
}
