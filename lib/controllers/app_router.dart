import 'package:auto_route/auto_route.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/article_list_screen.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/article_screen.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/articles_category_screen.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/category_list_screen.dart';
import 'package:ureport_ecaro/ui/pages/chat/chat_screen.dart';
import 'package:ureport_ecaro/ui/pages/home/home_screen.dart';
import 'package:ureport_ecaro/ui/pages/login-register/login.dart';
import 'package:ureport_ecaro/ui/pages/login-register/register.dart';
import 'package:ureport_ecaro/ui/pages/open_app/onboarding_screen.dart';
import 'package:ureport_ecaro/ui/pages/open_app/open_app_screen.dart';
import 'package:ureport_ecaro/ui/pages/opinion/opinion_search_screen.dart';
import 'package:ureport_ecaro/ui/pages/opinion/opinion_screen.dart';
import 'package:ureport_ecaro/ui/pages/opinion/opinion_from_search_screen.dart';
import 'package:ureport_ecaro/ui/pages/profile/about_screen.dart';
import 'package:ureport_ecaro/ui/pages/profile/account_screen.dart';
import 'package:ureport_ecaro/ui/pages/profile/change_pw_screen.dart';
import 'package:ureport_ecaro/ui/pages/profile/feedback_screen.dart';
import 'package:ureport_ecaro/ui/pages/profile/language_screen.dart';
import 'package:ureport_ecaro/ui/pages/profile/menu_screen.dart';
import 'package:ureport_ecaro/ui/pages/profile/notification_screen.dart';
import 'package:ureport_ecaro/ui/pages/profile/profile_screen.dart';
import 'package:ureport_ecaro/ui/pages/root_page.dart';

import '../ui/pages/login-register/forgot_password.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    // Root
    AdaptiveRoute(page: RootPage, initial: true, children: [
      AdaptiveRoute(page: MenuScreen),
      AdaptiveRoute(page: Chat),
      AdaptiveRoute(page: CategoryListScreen),
      AdaptiveRoute(page: HomeScreen),
      AdaptiveRoute(page: Opinion),
    ]),
    // More

    AdaptiveRoute(page: AboutScreen),
    AdaptiveRoute(page: ChangePasswordScreen),
    AdaptiveRoute(page: NotificationScreen),
    AdaptiveRoute(page: AccountScreen),
    AdaptiveRoute(page: LanguageScreen),
    AdaptiveRoute(page: FeedbackScreen),

    // Chat

    // Profile
    AdaptiveRoute(page: ProfileScreen),
    AdaptiveRoute(page: RegisterScreen),
    AdaptiveRoute(page: LoginScreen),
    AdaptiveRoute(page: ForgotPasswordScreen),
    AdaptiveRoute(page: OpenAppScreen),
    AdaptiveRoute(page: OnboardingScreen),
    // Category Article Flow

    AdaptiveRoute(page: ArticleScreen),
    AdaptiveRoute(page: ArticleListScreen),
    AdaptiveRoute(page: ArticlesCategoryScreen),

    // HOME

    // Opinions

    AdaptiveRoute(page: OpinionSearchScreen),
    AdaptiveRoute(page: OpinionFromSearchScreen),
  ],
)
class $AppRouter {}
