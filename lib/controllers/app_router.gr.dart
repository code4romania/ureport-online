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
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:flutter/material.dart' as _i26;
import 'package:ureport_ecaro/controllers/category_stories_store.dart' as _i29;
import 'package:ureport_ecaro/models/category.dart' as _i28;
import 'package:ureport_ecaro/models/story.dart' as _i27;
import 'package:ureport_ecaro/ui/pages/category-articles/article_list_screen.dart'
    as _i14;
import 'package:ureport_ecaro/ui/pages/category-articles/article_screen.dart'
    as _i13;
import 'package:ureport_ecaro/ui/pages/category-articles/articles_category_screen.dart'
    as _i15;
import 'package:ureport_ecaro/ui/pages/category-articles/badges_screen.dart'
    as _i16;
import 'package:ureport_ecaro/ui/pages/category-articles/category_list_screen.dart'
    as _i22;
import 'package:ureport_ecaro/ui/pages/category-articles/category_list_search_screen.dart'
    as _i17;
import 'package:ureport_ecaro/ui/pages/chat/chat_screen.dart' as _i21;
import 'package:ureport_ecaro/ui/pages/home/home_screen.dart' as _i23;
import 'package:ureport_ecaro/ui/pages/login-register/forgot_password.dart'
    as _i10;
import 'package:ureport_ecaro/ui/pages/login-register/login.dart' as _i9;
import 'package:ureport_ecaro/ui/pages/login-register/register.dart' as _i8;
import 'package:ureport_ecaro/ui/pages/open_app/onboarding_screen.dart' as _i12;
import 'package:ureport_ecaro/ui/pages/open_app/open_app_screen.dart' as _i11;
import 'package:ureport_ecaro/ui/pages/opinion/opinion_from_search_screen.dart'
    as _i19;
import 'package:ureport_ecaro/ui/pages/opinion/opinion_screen.dart' as _i24;
import 'package:ureport_ecaro/ui/pages/opinion/opinion_search_screen.dart'
    as _i18;
import 'package:ureport_ecaro/ui/pages/profile/about_screen.dart' as _i2;
import 'package:ureport_ecaro/ui/pages/profile/account_screen.dart' as _i5;
import 'package:ureport_ecaro/ui/pages/profile/change_pw_screen.dart' as _i3;
import 'package:ureport_ecaro/ui/pages/profile/feedback_screen.dart' as _i7;
import 'package:ureport_ecaro/ui/pages/profile/language_screen.dart' as _i6;
import 'package:ureport_ecaro/ui/pages/profile/menu_screen.dart' as _i20;
import 'package:ureport_ecaro/ui/pages/profile/notification_screen.dart' as _i4;
import 'package:ureport_ecaro/ui/pages/root_page.dart' as _i1;

class AppRouter extends _i25.RootStackRouter {
  AppRouter([_i26.GlobalKey<_i26.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    RootPageRoute.name: (routeData) {
      final args = routeData.argsAs<RootPageRouteArgs>(
          orElse: () => const RootPageRouteArgs());
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.RootPage(key: args.key),
        opaque: true,
      );
    },
    AboutScreenRoute.name: (routeData) {
      final args = routeData.argsAs<AboutScreenRouteArgs>();
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.AboutScreen(
          key: args.key,
          translations: args.translations,
        ),
        opaque: true,
      );
    },
    ChangePasswordScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordScreenRouteArgs>();
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.ChangePasswordScreen(
          key: args.key,
          translations: args.translations,
        ),
        opaque: true,
      );
    },
    NotificationScreenRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationScreenRouteArgs>();
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.NotificationScreen(
          key: args.key,
          translations: args.translations,
        ),
        opaque: true,
      );
    },
    AccountScreenRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.AccountScreen(),
        opaque: true,
      );
    },
    LanguageScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LanguageScreenRouteArgs>();
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i6.LanguageScreen(
          key: args.key,
          translations: args.translations,
        ),
        opaque: true,
      );
    },
    FeedbackScreenRoute.name: (routeData) {
      final args = routeData.argsAs<FeedbackScreenRouteArgs>();
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i7.FeedbackScreen(
          key: args.key,
          translations: args.translations,
        ),
        opaque: true,
      );
    },
    RegisterScreenRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.RegisterScreen(),
        opaque: true,
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginScreen(),
        opaque: true,
      );
    },
    ForgotPasswordScreenRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.ForgotPasswordScreen(),
        opaque: true,
      );
    },
    OpenAppScreenRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.OpenAppScreen(),
        opaque: true,
      );
    },
    OnboardingScreenRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.OnboardingScreen(),
        opaque: true,
      );
    },
    ArticleScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleScreenRouteArgs>();
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i13.ArticleScreen(
          key: args.key,
          storyId: args.storyId,
          preloadedStory: args.preloadedStory,
          isComingFromHome: args.isComingFromHome,
        ),
        opaque: true,
      );
    },
    ArticleListScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleListScreenRouteArgs>();
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i14.ArticleListScreen(
          key: args.key,
          categoryTitle: args.categoryTitle,
          subcategoryTitle: args.subcategoryTitle,
          stories: args.stories,
        ),
        opaque: true,
      );
    },
    ArticlesCategoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ArticlesCategoryScreenRouteArgs>();
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i15.ArticlesCategoryScreen(
          key: args.key,
          result: args.result,
          categoryTitle: args.categoryTitle,
          storyStore: args.storyStore,
        ),
        opaque: true,
      );
    },
    BadgesScreenRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.BadgesScreen(),
        opaque: true,
      );
    },
    CategoryListSearchScreenRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i17.CategoryListSearchScreen(),
        opaque: true,
      );
    },
    OpinionSearchScreenRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.OpinionSearchScreen(),
        opaque: true,
      );
    },
    OpinionFromSearchScreenRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.OpinionFromSearchScreen(),
        opaque: true,
      );
    },
    MenuScreenRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.MenuScreen(),
        opaque: true,
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i21.Chat(args.from),
        opaque: true,
      );
    },
    CategoryListScreenRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i22.CategoryListScreen(),
        opaque: true,
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i23.HomeScreen(),
        opaque: true,
      );
    },
    OpinionRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i24.Opinion(),
        opaque: true,
      );
    },
  };

  @override
  List<_i25.RouteConfig> get routes => [
        _i25.RouteConfig(
          RootPageRoute.name,
          path: '/',
          children: [
            _i25.RouteConfig(
              MenuScreenRoute.name,
              path: 'menu-screen',
              parent: RootPageRoute.name,
            ),
            _i25.RouteConfig(
              ChatRoute.name,
              path: 'Chat',
              parent: RootPageRoute.name,
            ),
            _i25.RouteConfig(
              CategoryListScreenRoute.name,
              path: 'category-list-screen',
              parent: RootPageRoute.name,
            ),
            _i25.RouteConfig(
              HomeScreenRoute.name,
              path: 'home-screen',
              parent: RootPageRoute.name,
            ),
            _i25.RouteConfig(
              OpinionRoute.name,
              path: 'Opinion',
              parent: RootPageRoute.name,
            ),
          ],
        ),
        _i25.RouteConfig(
          AboutScreenRoute.name,
          path: '/about-screen',
        ),
        _i25.RouteConfig(
          ChangePasswordScreenRoute.name,
          path: '/change-password-screen',
        ),
        _i25.RouteConfig(
          NotificationScreenRoute.name,
          path: '/notification-screen',
        ),
        _i25.RouteConfig(
          AccountScreenRoute.name,
          path: '/account-screen',
        ),
        _i25.RouteConfig(
          LanguageScreenRoute.name,
          path: '/language-screen',
        ),
        _i25.RouteConfig(
          FeedbackScreenRoute.name,
          path: '/feedback-screen',
        ),
        _i25.RouteConfig(
          RegisterScreenRoute.name,
          path: '/register-screen',
        ),
        _i25.RouteConfig(
          LoginScreenRoute.name,
          path: '/login-screen',
        ),
        _i25.RouteConfig(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        ),
        _i25.RouteConfig(
          OpenAppScreenRoute.name,
          path: '/open-app-screen',
        ),
        _i25.RouteConfig(
          OnboardingScreenRoute.name,
          path: '/onboarding-screen',
        ),
        _i25.RouteConfig(
          ArticleScreenRoute.name,
          path: '/article-screen',
        ),
        _i25.RouteConfig(
          ArticleListScreenRoute.name,
          path: '/article-list-screen',
        ),
        _i25.RouteConfig(
          ArticlesCategoryScreenRoute.name,
          path: '/articles-category-screen',
        ),
        _i25.RouteConfig(
          BadgesScreenRoute.name,
          path: '/badges-screen',
        ),
        _i25.RouteConfig(
          CategoryListSearchScreenRoute.name,
          path: '/category-list-search-screen',
        ),
        _i25.RouteConfig(
          OpinionSearchScreenRoute.name,
          path: '/opinion-search-screen',
        ),
        _i25.RouteConfig(
          OpinionFromSearchScreenRoute.name,
          path: '/opinion-from-search-screen',
        ),
      ];
}

/// generated route for
/// [_i1.RootPage]
class RootPageRoute extends _i25.PageRouteInfo<RootPageRouteArgs> {
  RootPageRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
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

  final _i26.Key? key;

  @override
  String toString() {
    return 'RootPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AboutScreen]
class AboutScreenRoute extends _i25.PageRouteInfo<AboutScreenRouteArgs> {
  AboutScreenRoute({
    _i26.Key? key,
    required Map<String, String> translations,
  }) : super(
          AboutScreenRoute.name,
          path: '/about-screen',
          args: AboutScreenRouteArgs(
            key: key,
            translations: translations,
          ),
        );

  static const String name = 'AboutScreenRoute';
}

class AboutScreenRouteArgs {
  const AboutScreenRouteArgs({
    this.key,
    required this.translations,
  });

  final _i26.Key? key;

  final Map<String, String> translations;

  @override
  String toString() {
    return 'AboutScreenRouteArgs{key: $key, translations: $translations}';
  }
}

/// generated route for
/// [_i3.ChangePasswordScreen]
class ChangePasswordScreenRoute
    extends _i25.PageRouteInfo<ChangePasswordScreenRouteArgs> {
  ChangePasswordScreenRoute({
    _i26.Key? key,
    required Map<String, String> translations,
  }) : super(
          ChangePasswordScreenRoute.name,
          path: '/change-password-screen',
          args: ChangePasswordScreenRouteArgs(
            key: key,
            translations: translations,
          ),
        );

  static const String name = 'ChangePasswordScreenRoute';
}

class ChangePasswordScreenRouteArgs {
  const ChangePasswordScreenRouteArgs({
    this.key,
    required this.translations,
  });

  final _i26.Key? key;

  final Map<String, String> translations;

  @override
  String toString() {
    return 'ChangePasswordScreenRouteArgs{key: $key, translations: $translations}';
  }
}

/// generated route for
/// [_i4.NotificationScreen]
class NotificationScreenRoute
    extends _i25.PageRouteInfo<NotificationScreenRouteArgs> {
  NotificationScreenRoute({
    _i26.Key? key,
    required Map<String, String> translations,
  }) : super(
          NotificationScreenRoute.name,
          path: '/notification-screen',
          args: NotificationScreenRouteArgs(
            key: key,
            translations: translations,
          ),
        );

  static const String name = 'NotificationScreenRoute';
}

class NotificationScreenRouteArgs {
  const NotificationScreenRouteArgs({
    this.key,
    required this.translations,
  });

  final _i26.Key? key;

  final Map<String, String> translations;

  @override
  String toString() {
    return 'NotificationScreenRouteArgs{key: $key, translations: $translations}';
  }
}

/// generated route for
/// [_i5.AccountScreen]
class AccountScreenRoute extends _i25.PageRouteInfo<void> {
  const AccountScreenRoute()
      : super(
          AccountScreenRoute.name,
          path: '/account-screen',
        );

  static const String name = 'AccountScreenRoute';
}

/// generated route for
/// [_i6.LanguageScreen]
class LanguageScreenRoute extends _i25.PageRouteInfo<LanguageScreenRouteArgs> {
  LanguageScreenRoute({
    _i26.Key? key,
    required Map<String, String> translations,
  }) : super(
          LanguageScreenRoute.name,
          path: '/language-screen',
          args: LanguageScreenRouteArgs(
            key: key,
            translations: translations,
          ),
        );

  static const String name = 'LanguageScreenRoute';
}

class LanguageScreenRouteArgs {
  const LanguageScreenRouteArgs({
    this.key,
    required this.translations,
  });

  final _i26.Key? key;

  final Map<String, String> translations;

  @override
  String toString() {
    return 'LanguageScreenRouteArgs{key: $key, translations: $translations}';
  }
}

/// generated route for
/// [_i7.FeedbackScreen]
class FeedbackScreenRoute extends _i25.PageRouteInfo<FeedbackScreenRouteArgs> {
  FeedbackScreenRoute({
    _i26.Key? key,
    required Map<String, String> translations,
  }) : super(
          FeedbackScreenRoute.name,
          path: '/feedback-screen',
          args: FeedbackScreenRouteArgs(
            key: key,
            translations: translations,
          ),
        );

  static const String name = 'FeedbackScreenRoute';
}

class FeedbackScreenRouteArgs {
  const FeedbackScreenRouteArgs({
    this.key,
    required this.translations,
  });

  final _i26.Key? key;

  final Map<String, String> translations;

  @override
  String toString() {
    return 'FeedbackScreenRouteArgs{key: $key, translations: $translations}';
  }
}

/// generated route for
/// [_i8.RegisterScreen]
class RegisterScreenRoute extends _i25.PageRouteInfo<void> {
  const RegisterScreenRoute()
      : super(
          RegisterScreenRoute.name,
          path: '/register-screen',
        );

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i9.LoginScreen]
class LoginScreenRoute extends _i25.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i10.ForgotPasswordScreen]
class ForgotPasswordScreenRoute extends _i25.PageRouteInfo<void> {
  const ForgotPasswordScreenRoute()
      : super(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        );

  static const String name = 'ForgotPasswordScreenRoute';
}

/// generated route for
/// [_i11.OpenAppScreen]
class OpenAppScreenRoute extends _i25.PageRouteInfo<void> {
  const OpenAppScreenRoute()
      : super(
          OpenAppScreenRoute.name,
          path: '/open-app-screen',
        );

  static const String name = 'OpenAppScreenRoute';
}

/// generated route for
/// [_i12.OnboardingScreen]
class OnboardingScreenRoute extends _i25.PageRouteInfo<void> {
  const OnboardingScreenRoute()
      : super(
          OnboardingScreenRoute.name,
          path: '/onboarding-screen',
        );

  static const String name = 'OnboardingScreenRoute';
}

/// generated route for
/// [_i13.ArticleScreen]
class ArticleScreenRoute extends _i25.PageRouteInfo<ArticleScreenRouteArgs> {
  ArticleScreenRoute({
    _i26.Key? key,
    int? storyId,
    _i27.StoryItem? preloadedStory,
    required bool isComingFromHome,
  }) : super(
          ArticleScreenRoute.name,
          path: '/article-screen',
          args: ArticleScreenRouteArgs(
            key: key,
            storyId: storyId,
            preloadedStory: preloadedStory,
            isComingFromHome: isComingFromHome,
          ),
        );

  static const String name = 'ArticleScreenRoute';
}

class ArticleScreenRouteArgs {
  const ArticleScreenRouteArgs({
    this.key,
    this.storyId,
    this.preloadedStory,
    required this.isComingFromHome,
  });

  final _i26.Key? key;

  final int? storyId;

  final _i27.StoryItem? preloadedStory;

  final bool isComingFromHome;

  @override
  String toString() {
    return 'ArticleScreenRouteArgs{key: $key, storyId: $storyId, preloadedStory: $preloadedStory, isComingFromHome: $isComingFromHome}';
  }
}

/// generated route for
/// [_i14.ArticleListScreen]
class ArticleListScreenRoute
    extends _i25.PageRouteInfo<ArticleListScreenRouteArgs> {
  ArticleListScreenRoute({
    _i26.Key? key,
    required String categoryTitle,
    required String subcategoryTitle,
    required List<_i28.Story> stories,
  }) : super(
          ArticleListScreenRoute.name,
          path: '/article-list-screen',
          args: ArticleListScreenRouteArgs(
            key: key,
            categoryTitle: categoryTitle,
            subcategoryTitle: subcategoryTitle,
            stories: stories,
          ),
        );

  static const String name = 'ArticleListScreenRoute';
}

class ArticleListScreenRouteArgs {
  const ArticleListScreenRouteArgs({
    this.key,
    required this.categoryTitle,
    required this.subcategoryTitle,
    required this.stories,
  });

  final _i26.Key? key;

  final String categoryTitle;

  final String subcategoryTitle;

  final List<_i28.Story> stories;

  @override
  String toString() {
    return 'ArticleListScreenRouteArgs{key: $key, categoryTitle: $categoryTitle, subcategoryTitle: $subcategoryTitle, stories: $stories}';
  }
}

/// generated route for
/// [_i15.ArticlesCategoryScreen]
class ArticlesCategoryScreenRoute
    extends _i25.PageRouteInfo<ArticlesCategoryScreenRouteArgs> {
  ArticlesCategoryScreenRoute({
    _i26.Key? key,
    required List<_i28.Result> result,
    required String categoryTitle,
    required _i29.CategoryStories storyStore,
  }) : super(
          ArticlesCategoryScreenRoute.name,
          path: '/articles-category-screen',
          args: ArticlesCategoryScreenRouteArgs(
            key: key,
            result: result,
            categoryTitle: categoryTitle,
            storyStore: storyStore,
          ),
        );

  static const String name = 'ArticlesCategoryScreenRoute';
}

class ArticlesCategoryScreenRouteArgs {
  const ArticlesCategoryScreenRouteArgs({
    this.key,
    required this.result,
    required this.categoryTitle,
    required this.storyStore,
  });

  final _i26.Key? key;

  final List<_i28.Result> result;

  final String categoryTitle;

  final _i29.CategoryStories storyStore;

  @override
  String toString() {
    return 'ArticlesCategoryScreenRouteArgs{key: $key, result: $result, categoryTitle: $categoryTitle, storyStore: $storyStore}';
  }
}

/// generated route for
/// [_i16.BadgesScreen]
class BadgesScreenRoute extends _i25.PageRouteInfo<void> {
  const BadgesScreenRoute()
      : super(
          BadgesScreenRoute.name,
          path: '/badges-screen',
        );

  static const String name = 'BadgesScreenRoute';
}

/// generated route for
/// [_i17.CategoryListSearchScreen]
class CategoryListSearchScreenRoute extends _i25.PageRouteInfo<void> {
  const CategoryListSearchScreenRoute()
      : super(
          CategoryListSearchScreenRoute.name,
          path: '/category-list-search-screen',
        );

  static const String name = 'CategoryListSearchScreenRoute';
}

/// generated route for
/// [_i18.OpinionSearchScreen]
class OpinionSearchScreenRoute extends _i25.PageRouteInfo<void> {
  const OpinionSearchScreenRoute()
      : super(
          OpinionSearchScreenRoute.name,
          path: '/opinion-search-screen',
        );

  static const String name = 'OpinionSearchScreenRoute';
}

/// generated route for
/// [_i19.OpinionFromSearchScreen]
class OpinionFromSearchScreenRoute extends _i25.PageRouteInfo<void> {
  const OpinionFromSearchScreenRoute()
      : super(
          OpinionFromSearchScreenRoute.name,
          path: '/opinion-from-search-screen',
        );

  static const String name = 'OpinionFromSearchScreenRoute';
}

/// generated route for
/// [_i20.MenuScreen]
class MenuScreenRoute extends _i25.PageRouteInfo<void> {
  const MenuScreenRoute()
      : super(
          MenuScreenRoute.name,
          path: 'menu-screen',
        );

  static const String name = 'MenuScreenRoute';
}

/// generated route for
/// [_i21.Chat]
class ChatRoute extends _i25.PageRouteInfo<ChatRouteArgs> {
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
/// [_i22.CategoryListScreen]
class CategoryListScreenRoute extends _i25.PageRouteInfo<void> {
  const CategoryListScreenRoute()
      : super(
          CategoryListScreenRoute.name,
          path: 'category-list-screen',
        );

  static const String name = 'CategoryListScreenRoute';
}

/// generated route for
/// [_i23.HomeScreen]
class HomeScreenRoute extends _i25.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: 'home-screen',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i24.Opinion]
class OpinionRoute extends _i25.PageRouteInfo<void> {
  const OpinionRoute()
      : super(
          OpinionRoute.name,
          path: 'Opinion',
        );

  static const String name = 'OpinionRoute';
}
