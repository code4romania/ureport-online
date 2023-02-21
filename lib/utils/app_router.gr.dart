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
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/material.dart' as _i22;
import 'package:ureport_ecaro/view/root_page.dart' as _i1;
import 'package:ureport_ecaro/view/screens/account/login-register/forgot_password.dart'
    as _i8;
import 'package:ureport_ecaro/view/screens/account/login-register/login.dart'
    as _i7;
import 'package:ureport_ecaro/view/screens/account/login-register/register.dart'
    as _i6;
import 'package:ureport_ecaro/view/screens/account/profile/about_view.dart'
    as _i2;
import 'package:ureport_ecaro/view/screens/account/profile/change_pw_view.dart'
    as _i3;
import 'package:ureport_ecaro/view/screens/account/profile/feedback_screen.dart'
    as _i4;
import 'package:ureport_ecaro/view/screens/account/profile/menu_view.dart'
    as _i15;
import 'package:ureport_ecaro/view/screens/account/profile/profile_view.dart'
    as _i5;
import 'package:ureport_ecaro/view/screens/category_article_flow/article_list_screen.dart'
    as _i12;
import 'package:ureport_ecaro/view/screens/category_article_flow/article_screen.dart'
    as _i11;
import 'package:ureport_ecaro/view/screens/category_article_flow/articles_category_screen.dart'
    as _i18;
import 'package:ureport_ecaro/view/screens/category_article_flow/category_list_screen.dart'
    as _i17;
import 'package:ureport_ecaro/view/screens/category_article_flow/model/story.dart'
    as _i23;
import 'package:ureport_ecaro/view/screens/chat/Chat.dart' as _i16;
import 'package:ureport_ecaro/view/screens/home/home_screen.dart' as _i19;
import 'package:ureport_ecaro/view/screens/open_app/onboarding_screen.dart'
    as _i10;
import 'package:ureport_ecaro/view/screens/open_app/open_app_screen.dart'
    as _i9;
import 'package:ureport_ecaro/view/screens/opinion/opinion_screen.dart' as _i20;
import 'package:ureport_ecaro/view/screens/opinion/opinion_screen_from_search.dart'
    as _i14;
import 'package:ureport_ecaro/view/screens/opinion/opinion_search.dart' as _i13;

class AppRouter extends _i21.RootStackRouter {
  AppRouter([_i22.GlobalKey<_i22.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    RootPageRoute.name: (routeData) {
      final args = routeData.argsAs<RootPageRouteArgs>(
          orElse: () => const RootPageRouteArgs());
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.RootPage(key: args.key),
        opaque: true,
      );
    },
    AboutScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.AboutScreen(),
        opaque: true,
      );
    },
    ProfileSettingsScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProfileSettingsScreen(),
        opaque: true,
      );
    },
    FeedbackScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.FeedbackScreen(),
        opaque: true,
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileScreen(),
        opaque: true,
      );
    },
    RegisterScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegisterScreen(),
        opaque: true,
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginScreen(),
        opaque: true,
      );
    },
    ForgotPasswordScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.ForgotPasswordScreen(),
        opaque: true,
      );
    },
    OpenAppScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.OpenAppScreen(),
        opaque: true,
      );
    },
    OnboardingScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.OnboardingScreen(),
        opaque: true,
      );
    },
    ArticleScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleScreenRouteArgs>();
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.ArticleScreen(
          key: args.key,
          article: args.article,
          title: args.title,
          image: args.image,
          date: args.date,
        ),
        opaque: true,
      );
    },
    ArticleListScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleListScreenRouteArgs>();
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i12.ArticleListScreen(
          key: args.key,
          articles: args.articles,
          categoryTitle: args.categoryTitle,
          subcategoryTitle: args.subcategoryTitle,
        ),
        opaque: true,
      );
    },
    OpinionSearchRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.OpinionSearch(),
        opaque: true,
      );
    },
    OpinionScreenFromSearchRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.OpinionScreenFromSearch(),
        opaque: true,
      );
    },
    MenuScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.MenuScreen(),
        opaque: true,
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i16.Chat(args.from),
        opaque: true,
      );
    },
    CategoryListScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i17.CategoryListScreen(),
        opaque: true,
      );
    },
    ArticlesCategoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ArticlesCategoryScreenRouteArgs>();
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i18.ArticlesCategoryScreen(
          key: args.key,
          categoryImg: args.categoryImg,
          categoryTitle: args.categoryTitle,
        ),
        opaque: true,
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.HomeScreen(),
        opaque: true,
      );
    },
    OpinionRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.Opinion(),
        opaque: true,
      );
    },
  };

  @override
  List<_i21.RouteConfig> get routes => [
        _i21.RouteConfig(
          RootPageRoute.name,
          path: '/',
          children: [
            _i21.RouteConfig(
              MenuScreenRoute.name,
              path: 'menu-screen',
              parent: RootPageRoute.name,
            ),
            _i21.RouteConfig(
              ChatRoute.name,
              path: 'Chat',
              parent: RootPageRoute.name,
            ),
            _i21.RouteConfig(
              CategoryListScreenRoute.name,
              path: 'category-list-screen',
              parent: RootPageRoute.name,
            ),
            _i21.RouteConfig(
              ArticlesCategoryScreenRoute.name,
              path: 'articles-category-screen',
              parent: RootPageRoute.name,
            ),
            _i21.RouteConfig(
              HomeScreenRoute.name,
              path: 'home-screen',
              parent: RootPageRoute.name,
            ),
            _i21.RouteConfig(
              OpinionRoute.name,
              path: 'Opinion',
              parent: RootPageRoute.name,
            ),
          ],
        ),
        _i21.RouteConfig(
          AboutScreenRoute.name,
          path: '/about-screen',
        ),
        _i21.RouteConfig(
          ProfileSettingsScreenRoute.name,
          path: '/profile-settings-screen',
        ),
        _i21.RouteConfig(
          FeedbackScreenRoute.name,
          path: '/feedback-screen',
        ),
        _i21.RouteConfig(
          ProfileScreenRoute.name,
          path: '/profile-screen',
        ),
        _i21.RouteConfig(
          RegisterScreenRoute.name,
          path: '/register-screen',
        ),
        _i21.RouteConfig(
          LoginScreenRoute.name,
          path: '/login-screen',
        ),
        _i21.RouteConfig(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        ),
        _i21.RouteConfig(
          OpenAppScreenRoute.name,
          path: '/open-app-screen',
        ),
        _i21.RouteConfig(
          OnboardingScreenRoute.name,
          path: '/onboarding-screen',
        ),
        _i21.RouteConfig(
          ArticleScreenRoute.name,
          path: '/article-screen',
        ),
        _i21.RouteConfig(
          ArticleListScreenRoute.name,
          path: '/article-list-screen',
        ),
        _i21.RouteConfig(
          OpinionSearchRoute.name,
          path: '/opinion-search',
        ),
        _i21.RouteConfig(
          OpinionScreenFromSearchRoute.name,
          path: '/opinion-screen-from-search',
        ),
      ];
}

/// generated route for
/// [_i1.RootPage]
class RootPageRoute extends _i21.PageRouteInfo<RootPageRouteArgs> {
  RootPageRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          RootPageRoute.name,
          path: '/',
          args: RootPageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RootPageRoute';
}

class RootPageRouteArgs {
  const RootPageRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'RootPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AboutScreen]
class AboutScreenRoute extends _i21.PageRouteInfo<void> {
  const AboutScreenRoute()
      : super(
          AboutScreenRoute.name,
          path: '/about-screen',
        );

  static const String name = 'AboutScreenRoute';
}

/// generated route for
/// [_i3.ProfileSettingsScreen]
class ProfileSettingsScreenRoute extends _i21.PageRouteInfo<void> {
  const ProfileSettingsScreenRoute()
      : super(
          ProfileSettingsScreenRoute.name,
          path: '/profile-settings-screen',
        );

  static const String name = 'ProfileSettingsScreenRoute';
}

/// generated route for
/// [_i4.FeedbackScreen]
class FeedbackScreenRoute extends _i21.PageRouteInfo<void> {
  const FeedbackScreenRoute()
      : super(
          FeedbackScreenRoute.name,
          path: '/feedback-screen',
        );

  static const String name = 'FeedbackScreenRoute';
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileScreenRoute extends _i21.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: '/profile-screen',
        );

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i6.RegisterScreen]
class RegisterScreenRoute extends _i21.PageRouteInfo<void> {
  const RegisterScreenRoute()
      : super(
          RegisterScreenRoute.name,
          path: '/register-screen',
        );

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i7.LoginScreen]
class LoginScreenRoute extends _i21.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i8.ForgotPasswordScreen]
class ForgotPasswordScreenRoute extends _i21.PageRouteInfo<void> {
  const ForgotPasswordScreenRoute()
      : super(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        );

  static const String name = 'ForgotPasswordScreenRoute';
}

/// generated route for
/// [_i9.OpenAppScreen]
class OpenAppScreenRoute extends _i21.PageRouteInfo<void> {
  const OpenAppScreenRoute()
      : super(
          OpenAppScreenRoute.name,
          path: '/open-app-screen',
        );

  static const String name = 'OpenAppScreenRoute';
}

/// generated route for
/// [_i10.OnboardingScreen]
class OnboardingScreenRoute extends _i21.PageRouteInfo<void> {
  const OnboardingScreenRoute()
      : super(
          OnboardingScreenRoute.name,
          path: '/onboarding-screen',
        );

  static const String name = 'OnboardingScreenRoute';
}

/// generated route for
/// [_i11.ArticleScreen]
class ArticleScreenRoute extends _i21.PageRouteInfo<ArticleScreenRouteArgs> {
  ArticleScreenRoute({
    _i22.Key? key,
    required _i23.Result article,
    required String title,
    required String image,
    required String date,
  }) : super(
          ArticleScreenRoute.name,
          path: '/article-screen',
          args: ArticleScreenRouteArgs(
            key: key,
            article: article,
            title: title,
            image: image,
            date: date,
          ),
        );

  static const String name = 'ArticleScreenRoute';
}

class ArticleScreenRouteArgs {
  const ArticleScreenRouteArgs({
    this.key,
    required this.article,
    required this.title,
    required this.image,
    required this.date,
  });

  final _i22.Key? key;

  final _i23.Result article;

  final String title;

  final String image;

  final String date;

  @override
  String toString() {
    return 'ArticleScreenRouteArgs{key: $key, article: $article, title: $title, image: $image, date: $date}';
  }
}

/// generated route for
/// [_i12.ArticleListScreen]
class ArticleListScreenRoute
    extends _i21.PageRouteInfo<ArticleListScreenRouteArgs> {
  ArticleListScreenRoute({
    _i22.Key? key,
    required List<_i23.Result> articles,
    required String categoryTitle,
    required String subcategoryTitle,
  }) : super(
          ArticleListScreenRoute.name,
          path: '/article-list-screen',
          args: ArticleListScreenRouteArgs(
            key: key,
            articles: articles,
            categoryTitle: categoryTitle,
            subcategoryTitle: subcategoryTitle,
          ),
        );

  static const String name = 'ArticleListScreenRoute';
}

class ArticleListScreenRouteArgs {
  const ArticleListScreenRouteArgs({
    this.key,
    required this.articles,
    required this.categoryTitle,
    required this.subcategoryTitle,
  });

  final _i22.Key? key;

  final List<_i23.Result> articles;

  final String categoryTitle;

  final String subcategoryTitle;

  @override
  String toString() {
    return 'ArticleListScreenRouteArgs{key: $key, articles: $articles, categoryTitle: $categoryTitle, subcategoryTitle: $subcategoryTitle}';
  }
}

/// generated route for
/// [_i13.OpinionSearch]
class OpinionSearchRoute extends _i21.PageRouteInfo<void> {
  const OpinionSearchRoute()
      : super(
          OpinionSearchRoute.name,
          path: '/opinion-search',
        );

  static const String name = 'OpinionSearchRoute';
}

/// generated route for
/// [_i14.OpinionScreenFromSearch]
class OpinionScreenFromSearchRoute extends _i21.PageRouteInfo<void> {
  const OpinionScreenFromSearchRoute()
      : super(
          OpinionScreenFromSearchRoute.name,
          path: '/opinion-screen-from-search',
        );

  static const String name = 'OpinionScreenFromSearchRoute';
}

/// generated route for
/// [_i15.MenuScreen]
class MenuScreenRoute extends _i21.PageRouteInfo<void> {
  const MenuScreenRoute()
      : super(
          MenuScreenRoute.name,
          path: 'menu-screen',
        );

  static const String name = 'MenuScreenRoute';
}

/// generated route for
/// [_i16.Chat]
class ChatRoute extends _i21.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({required String from})
      : super(
          ChatRoute.name,
          path: 'Chat',
          args: ChatRouteArgs(from: from),
        );

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({required this.from});

  final String from;

  @override
  String toString() {
    return 'ChatRouteArgs{from: $from}';
  }
}

/// generated route for
/// [_i17.CategoryListScreen]
class CategoryListScreenRoute extends _i21.PageRouteInfo<void> {
  const CategoryListScreenRoute()
      : super(
          CategoryListScreenRoute.name,
          path: 'category-list-screen',
        );

  static const String name = 'CategoryListScreenRoute';
}

/// generated route for
/// [_i18.ArticlesCategoryScreen]
class ArticlesCategoryScreenRoute
    extends _i21.PageRouteInfo<ArticlesCategoryScreenRouteArgs> {
  ArticlesCategoryScreenRoute({
    _i22.Key? key,
    required String categoryImg,
    required String categoryTitle,
  }) : super(
          ArticlesCategoryScreenRoute.name,
          path: 'articles-category-screen',
          args: ArticlesCategoryScreenRouteArgs(
            key: key,
            categoryImg: categoryImg,
            categoryTitle: categoryTitle,
          ),
        );

  static const String name = 'ArticlesCategoryScreenRoute';
}

class ArticlesCategoryScreenRouteArgs {
  const ArticlesCategoryScreenRouteArgs({
    this.key,
    required this.categoryImg,
    required this.categoryTitle,
  });

  final _i22.Key? key;

  final String categoryImg;

  final String categoryTitle;

  @override
  String toString() {
    return 'ArticlesCategoryScreenRouteArgs{key: $key, categoryImg: $categoryImg, categoryTitle: $categoryTitle}';
  }
}

/// generated route for
/// [_i19.HomeScreen]
class HomeScreenRoute extends _i21.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: 'home-screen',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i20.Opinion]
class OpinionRoute extends _i21.PageRouteInfo<void> {
  const OpinionRoute()
      : super(
          OpinionRoute.name,
          path: 'Opinion',
        );

  static const String name = 'OpinionRoute';
}
