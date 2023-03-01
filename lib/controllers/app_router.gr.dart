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
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;
import 'package:ureport_ecaro/controllers/story_state.dart' as _i26;
import 'package:ureport_ecaro/models/category.dart' as _i28;
import 'package:ureport_ecaro/models/story.dart' as _i27;
import 'package:ureport_ecaro/ui/pages/category-articles/article_list_screen.dart'
    as _i15;
import 'package:ureport_ecaro/ui/pages/category-articles/article_screen.dart'
    as _i14;
import 'package:ureport_ecaro/ui/pages/category-articles/articles_category_screen.dart'
    as _i16;
import 'package:ureport_ecaro/ui/pages/category-articles/category_list_screen.dart'
    as _i21;
import 'package:ureport_ecaro/ui/pages/chat/chat_screen.dart' as _i20;
import 'package:ureport_ecaro/ui/pages/home/home_screen.dart' as _i22;
import 'package:ureport_ecaro/ui/pages/login-register/forgot_password.dart'
    as _i11;
import 'package:ureport_ecaro/ui/pages/login-register/login.dart' as _i10;
import 'package:ureport_ecaro/ui/pages/login-register/register.dart' as _i9;
import 'package:ureport_ecaro/ui/pages/open_app/onboarding_screen.dart' as _i13;
import 'package:ureport_ecaro/ui/pages/open_app/open_app_screen.dart' as _i12;
import 'package:ureport_ecaro/ui/pages/opinion/components/opinion_search.dart'
    as _i17;
import 'package:ureport_ecaro/ui/pages/opinion/opinion_screen.dart' as _i23;
import 'package:ureport_ecaro/ui/pages/opinion/opinion_screen_from_search.dart'
    as _i18;
import 'package:ureport_ecaro/ui/pages/profile/about_screen.dart' as _i2;
import 'package:ureport_ecaro/ui/pages/profile/account_screen.dart' as _i5;
import 'package:ureport_ecaro/ui/pages/profile/change_pw_screen.dart' as _i3;
import 'package:ureport_ecaro/ui/pages/profile/feedback_screen.dart' as _i7;
import 'package:ureport_ecaro/ui/pages/profile/language_screen.dart' as _i6;
import 'package:ureport_ecaro/ui/pages/profile/menu_screen.dart' as _i19;
import 'package:ureport_ecaro/ui/pages/profile/notification_screen.dart' as _i4;
import 'package:ureport_ecaro/ui/pages/profile/profile_screen.dart' as _i8;
import 'package:ureport_ecaro/ui/pages/root_page.dart' as _i1;

class AppRouter extends _i24.RootStackRouter {
  AppRouter([_i25.GlobalKey<_i25.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    RootPageRoute.name: (routeData) {
      final args = routeData.argsAs<RootPageRouteArgs>(
          orElse: () => const RootPageRouteArgs());
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.RootPage(key: args.key),
        opaque: true,
      );
    },
    AboutScreenRoute.name: (routeData) {
      final args = routeData.argsAs<AboutScreenRouteArgs>();
      return _i24.AdaptivePage<dynamic>(
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
      return _i24.AdaptivePage<dynamic>(
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
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.NotificationScreen(
          key: args.key,
          translations: args.translations,
        ),
        opaque: true,
      );
    },
    AccountScreenRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.AccountScreen(),
        opaque: true,
      );
    },
    LanguageScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LanguageScreenRouteArgs>();
      return _i24.AdaptivePage<dynamic>(
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
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i7.FeedbackScreen(
          key: args.key,
          translations: args.translations,
        ),
        opaque: true,
      );
    },
    ProfileScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileScreenRouteArgs>();
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i8.ProfileScreen(
          key: args.key,
          translation: args.translation,
        ),
        opaque: true,
      );
    },
    RegisterScreenRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.RegisterScreen(),
        opaque: true,
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.LoginScreen(),
        opaque: true,
      );
    },
    ForgotPasswordScreenRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.ForgotPasswordScreen(),
        opaque: true,
      );
    },
    OpenAppScreenRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.OpenAppScreen(),
        opaque: true,
      );
    },
    OnboardingScreenRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.OnboardingScreen(),
        opaque: true,
      );
    },
    ArticleScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleScreenRouteArgs>(
          orElse: () => const ArticleScreenRouteArgs());
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i14.ArticleScreen(
          key: args.key,
          storyStore: args.storyStore,
          storyId: args.storyId,
          storyFull: args.storyFull,
        ),
        opaque: true,
      );
    },
    ArticleListScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleListScreenRouteArgs>();
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i15.ArticleListScreen(
          key: args.key,
          categoryTitle: args.categoryTitle,
          subcategoryTitle: args.subcategoryTitle,
          storyStore: args.storyStore,
          stories: args.stories,
        ),
        opaque: true,
      );
    },
    ArticlesCategoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ArticlesCategoryScreenRouteArgs>();
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i16.ArticlesCategoryScreen(
          key: args.key,
          result: args.result,
          categoryTitle: args.categoryTitle,
          storyStore: args.storyStore,
        ),
        opaque: true,
      );
    },
    OpinionSearchRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.OpinionSearch(),
        opaque: true,
      );
    },
    OpinionScreenFromSearchRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.OpinionScreenFromSearch(),
        opaque: true,
      );
    },
    MenuScreenRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.MenuScreen(),
        opaque: true,
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i20.Chat(args.from),
        opaque: true,
      );
    },
    CategoryListScreenRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i21.CategoryListScreen(),
        opaque: true,
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i22.HomeScreen(),
        opaque: true,
      );
    },
    OpinionRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i23.Opinion(),
        opaque: true,
      );
    },
  };

  @override
  List<_i24.RouteConfig> get routes => [
        _i24.RouteConfig(
          RootPageRoute.name,
          path: '/',
          children: [
            _i24.RouteConfig(
              MenuScreenRoute.name,
              path: 'menu-screen',
              parent: RootPageRoute.name,
            ),
            _i24.RouteConfig(
              ChatRoute.name,
              path: 'Chat',
              parent: RootPageRoute.name,
            ),
            _i24.RouteConfig(
              CategoryListScreenRoute.name,
              path: 'category-list-screen',
              parent: RootPageRoute.name,
            ),
            _i24.RouteConfig(
              HomeScreenRoute.name,
              path: 'home-screen',
              parent: RootPageRoute.name,
            ),
            _i24.RouteConfig(
              OpinionRoute.name,
              path: 'Opinion',
              parent: RootPageRoute.name,
            ),
          ],
        ),
        _i24.RouteConfig(
          AboutScreenRoute.name,
          path: '/about-screen',
        ),
        _i24.RouteConfig(
          ChangePasswordScreenRoute.name,
          path: '/change-password-screen',
        ),
        _i24.RouteConfig(
          NotificationScreenRoute.name,
          path: '/notification-screen',
        ),
        _i24.RouteConfig(
          AccountScreenRoute.name,
          path: '/account-screen',
        ),
        _i24.RouteConfig(
          LanguageScreenRoute.name,
          path: '/language-screen',
        ),
        _i24.RouteConfig(
          FeedbackScreenRoute.name,
          path: '/feedback-screen',
        ),
        _i24.RouteConfig(
          ProfileScreenRoute.name,
          path: '/profile-screen',
        ),
        _i24.RouteConfig(
          RegisterScreenRoute.name,
          path: '/register-screen',
        ),
        _i24.RouteConfig(
          LoginScreenRoute.name,
          path: '/login-screen',
        ),
        _i24.RouteConfig(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        ),
        _i24.RouteConfig(
          OpenAppScreenRoute.name,
          path: '/open-app-screen',
        ),
        _i24.RouteConfig(
          OnboardingScreenRoute.name,
          path: '/onboarding-screen',
        ),
        _i24.RouteConfig(
          ArticleScreenRoute.name,
          path: '/article-screen',
        ),
        _i24.RouteConfig(
          ArticleListScreenRoute.name,
          path: '/article-list-screen',
        ),
        _i24.RouteConfig(
          ArticlesCategoryScreenRoute.name,
          path: '/articles-category-screen',
        ),
        _i24.RouteConfig(
          OpinionSearchRoute.name,
          path: '/opinion-search',
        ),
        _i24.RouteConfig(
          OpinionScreenFromSearchRoute.name,
          path: '/opinion-screen-from-search',
        ),
      ];
}

/// generated route for
/// [_i1.RootPage]
class RootPageRoute extends _i24.PageRouteInfo<RootPageRouteArgs> {
  RootPageRoute({
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
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

  final _i25.Key? key;

  @override
  String toString() {
    return 'RootPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AboutScreen]
class AboutScreenRoute extends _i24.PageRouteInfo<AboutScreenRouteArgs> {
  AboutScreenRoute({
    _i25.Key? key,
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

  final _i25.Key? key;

  final Map<String, String> translations;

  @override
  String toString() {
    return 'AboutScreenRouteArgs{key: $key, translations: $translations}';
  }
}

/// generated route for
/// [_i3.ChangePasswordScreen]
class ChangePasswordScreenRoute
    extends _i24.PageRouteInfo<ChangePasswordScreenRouteArgs> {
  ChangePasswordScreenRoute({
    _i25.Key? key,
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

  final _i25.Key? key;

  final Map<String, String> translations;

  @override
  String toString() {
    return 'ChangePasswordScreenRouteArgs{key: $key, translations: $translations}';
  }
}

/// generated route for
/// [_i4.NotificationScreen]
class NotificationScreenRoute
    extends _i24.PageRouteInfo<NotificationScreenRouteArgs> {
  NotificationScreenRoute({
    _i25.Key? key,
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

  final _i25.Key? key;

  final Map<String, String> translations;

  @override
  String toString() {
    return 'NotificationScreenRouteArgs{key: $key, translations: $translations}';
  }
}

/// generated route for
/// [_i5.AccountScreen]
class AccountScreenRoute extends _i24.PageRouteInfo<void> {
  const AccountScreenRoute()
      : super(
          AccountScreenRoute.name,
          path: '/account-screen',
        );

  static const String name = 'AccountScreenRoute';
}

/// generated route for
/// [_i6.LanguageScreen]
class LanguageScreenRoute extends _i24.PageRouteInfo<LanguageScreenRouteArgs> {
  LanguageScreenRoute({
    _i25.Key? key,
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

  final _i25.Key? key;

  final Map<String, String> translations;

  @override
  String toString() {
    return 'LanguageScreenRouteArgs{key: $key, translations: $translations}';
  }
}

/// generated route for
/// [_i7.FeedbackScreen]
class FeedbackScreenRoute extends _i24.PageRouteInfo<FeedbackScreenRouteArgs> {
  FeedbackScreenRoute({
    _i25.Key? key,
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

  final _i25.Key? key;

  final Map<String, String> translations;

  @override
  String toString() {
    return 'FeedbackScreenRouteArgs{key: $key, translations: $translations}';
  }
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileScreenRoute extends _i24.PageRouteInfo<ProfileScreenRouteArgs> {
  ProfileScreenRoute({
    _i25.Key? key,
    required Map<String, String> translation,
  }) : super(
          ProfileScreenRoute.name,
          path: '/profile-screen',
          args: ProfileScreenRouteArgs(
            key: key,
            translation: translation,
          ),
        );

  static const String name = 'ProfileScreenRoute';
}

class ProfileScreenRouteArgs {
  const ProfileScreenRouteArgs({
    this.key,
    required this.translation,
  });

  final _i25.Key? key;

  final Map<String, String> translation;

  @override
  String toString() {
    return 'ProfileScreenRouteArgs{key: $key, translation: $translation}';
  }
}

/// generated route for
/// [_i9.RegisterScreen]
class RegisterScreenRoute extends _i24.PageRouteInfo<void> {
  const RegisterScreenRoute()
      : super(
          RegisterScreenRoute.name,
          path: '/register-screen',
        );

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i10.LoginScreen]
class LoginScreenRoute extends _i24.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i11.ForgotPasswordScreen]
class ForgotPasswordScreenRoute extends _i24.PageRouteInfo<void> {
  const ForgotPasswordScreenRoute()
      : super(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        );

  static const String name = 'ForgotPasswordScreenRoute';
}

/// generated route for
/// [_i12.OpenAppScreen]
class OpenAppScreenRoute extends _i24.PageRouteInfo<void> {
  const OpenAppScreenRoute()
      : super(
          OpenAppScreenRoute.name,
          path: '/open-app-screen',
        );

  static const String name = 'OpenAppScreenRoute';
}

/// generated route for
/// [_i13.OnboardingScreen]
class OnboardingScreenRoute extends _i24.PageRouteInfo<void> {
  const OnboardingScreenRoute()
      : super(
          OnboardingScreenRoute.name,
          path: '/onboarding-screen',
        );

  static const String name = 'OnboardingScreenRoute';
}

/// generated route for
/// [_i14.ArticleScreen]
class ArticleScreenRoute extends _i24.PageRouteInfo<ArticleScreenRouteArgs> {
  ArticleScreenRoute({
    _i25.Key? key,
    _i26.StoryStore? storyStore,
    String? storyId,
    _i27.StoryItem? storyFull,
  }) : super(
          ArticleScreenRoute.name,
          path: '/article-screen',
          args: ArticleScreenRouteArgs(
            key: key,
            storyStore: storyStore,
            storyId: storyId,
            storyFull: storyFull,
          ),
        );

  static const String name = 'ArticleScreenRoute';
}

class ArticleScreenRouteArgs {
  const ArticleScreenRouteArgs({
    this.key,
    this.storyStore,
    this.storyId,
    this.storyFull,
  });

  final _i25.Key? key;

  final _i26.StoryStore? storyStore;

  final String? storyId;

  final _i27.StoryItem? storyFull;

  @override
  String toString() {
    return 'ArticleScreenRouteArgs{key: $key, storyStore: $storyStore, storyId: $storyId, storyFull: $storyFull}';
  }
}

/// generated route for
/// [_i15.ArticleListScreen]
class ArticleListScreenRoute
    extends _i24.PageRouteInfo<ArticleListScreenRouteArgs> {
  ArticleListScreenRoute({
    _i25.Key? key,
    required String categoryTitle,
    required String subcategoryTitle,
    required _i26.StoryStore storyStore,
    required List<_i28.Story> stories,
  }) : super(
          ArticleListScreenRoute.name,
          path: '/article-list-screen',
          args: ArticleListScreenRouteArgs(
            key: key,
            categoryTitle: categoryTitle,
            subcategoryTitle: subcategoryTitle,
            storyStore: storyStore,
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
    required this.storyStore,
    required this.stories,
  });

  final _i25.Key? key;

  final String categoryTitle;

  final String subcategoryTitle;

  final _i26.StoryStore storyStore;

  final List<_i28.Story> stories;

  @override
  String toString() {
    return 'ArticleListScreenRouteArgs{key: $key, categoryTitle: $categoryTitle, subcategoryTitle: $subcategoryTitle, storyStore: $storyStore, stories: $stories}';
  }
}

/// generated route for
/// [_i16.ArticlesCategoryScreen]
class ArticlesCategoryScreenRoute
    extends _i24.PageRouteInfo<ArticlesCategoryScreenRouteArgs> {
  ArticlesCategoryScreenRoute({
    _i25.Key? key,
    required List<_i28.Result> result,
    required String categoryTitle,
    required _i26.StoryStore storyStore,
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

  final _i25.Key? key;

  final List<_i28.Result> result;

  final String categoryTitle;

  final _i26.StoryStore storyStore;

  @override
  String toString() {
    return 'ArticlesCategoryScreenRouteArgs{key: $key, result: $result, categoryTitle: $categoryTitle, storyStore: $storyStore}';
  }
}

/// generated route for
/// [_i17.OpinionSearch]
class OpinionSearchRoute extends _i24.PageRouteInfo<void> {
  const OpinionSearchRoute()
      : super(
          OpinionSearchRoute.name,
          path: '/opinion-search',
        );

  static const String name = 'OpinionSearchRoute';
}

/// generated route for
/// [_i18.OpinionScreenFromSearch]
class OpinionScreenFromSearchRoute extends _i24.PageRouteInfo<void> {
  const OpinionScreenFromSearchRoute()
      : super(
          OpinionScreenFromSearchRoute.name,
          path: '/opinion-screen-from-search',
        );

  static const String name = 'OpinionScreenFromSearchRoute';
}

/// generated route for
/// [_i19.MenuScreen]
class MenuScreenRoute extends _i24.PageRouteInfo<void> {
  const MenuScreenRoute()
      : super(
          MenuScreenRoute.name,
          path: 'menu-screen',
        );

  static const String name = 'MenuScreenRoute';
}

/// generated route for
/// [_i20.Chat]
class ChatRoute extends _i24.PageRouteInfo<ChatRouteArgs> {
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
/// [_i21.CategoryListScreen]
class CategoryListScreenRoute extends _i24.PageRouteInfo<void> {
  const CategoryListScreenRoute()
      : super(
          CategoryListScreenRoute.name,
          path: 'category-list-screen',
        );

  static const String name = 'CategoryListScreenRoute';
}

/// generated route for
/// [_i22.HomeScreen]
class HomeScreenRoute extends _i24.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: 'home-screen',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i23.Opinion]
class OpinionRoute extends _i24.PageRouteInfo<void> {
  const OpinionRoute()
      : super(
          OpinionRoute.name,
          path: 'Opinion',
        );

  static const String name = 'OpinionRoute';
}
