import 'package:auto_route/auto_route.dart';
import 'package:ureport_ecaro/view/root_page.dart';
import 'package:ureport_ecaro/view/screens/account/login-register/forgot_password.dart';
import 'package:ureport_ecaro/view/screens/account/login-register/login.dart';
import 'package:ureport_ecaro/view/screens/account/login-register/register.dart';
import 'package:ureport_ecaro/view/screens/account/profile/about_view.dart';
import 'package:ureport_ecaro/view/screens/account/profile/change_pw_view.dart';
import 'package:ureport_ecaro/view/screens/account/profile/feedback_screen.dart';
import 'package:ureport_ecaro/view/screens/account/profile/menu_view.dart';
import 'package:ureport_ecaro/view/screens/account/profile/profile_view.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/article_list_screen.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/article_screen.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/articles_category_screen.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/category_list_screen.dart';
import 'package:ureport_ecaro/view/screens/chat/Chat.dart';
import 'package:ureport_ecaro/view/screens/home/home_screen.dart';
import 'package:ureport_ecaro/view/screens/open_app/onboarding_screen.dart';
import 'package:ureport_ecaro/view/screens/open_app/open_app_screen.dart';
import 'package:ureport_ecaro/view/screens/opinion/opinion_screen.dart';
import 'package:ureport_ecaro/view/screens/opinion/opinion_screen_from_search.dart';
import 'package:ureport_ecaro/view/screens/opinion/opinion_search.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    // Root
    AdaptiveRoute(page: RootPage, initial: true, children: [
      AdaptiveRoute(page: MenuScreen),
      AdaptiveRoute(page: Chat),
      AdaptiveRoute(page: CategoryListScreen),
      AdaptiveRoute(page: ArticlesCategoryScreen),
      AdaptiveRoute(page: HomeScreen),
      AdaptiveRoute(page: Opinion),
    ]),
    // More

    AdaptiveRoute(page: AboutScreen),
    AdaptiveRoute(page: ProfileSettingsScreen),
    // AdaptiveRoute(page: LanguageScreen),
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

    // AdaptiveRoute(page: ArticlesCategoryScreen),
    AdaptiveRoute(page: ArticleScreen),
    AdaptiveRoute(page: ArticleListScreen),
    // HOME

    // Opinions

    AdaptiveRoute(page: OpinionSearch),
    AdaptiveRoute(page: OpinionScreenFromSearch),
  ],
)
class $AppRouter {}
