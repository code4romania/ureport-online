import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:ureport_ecaro/view/root_page.dart';
import 'package:ureport_ecaro/view/screens/account/login-register/forgot_password.dart';
import 'package:ureport_ecaro/view/screens/account/login-register/login.dart';
import 'package:ureport_ecaro/view/screens/account/login-register/register.dart';
import 'package:ureport_ecaro/view/screens/account/profile/about_view.dart';
import 'package:ureport_ecaro/view/screens/account/profile/change_pw_view.dart';
import 'package:ureport_ecaro/view/screens/account/profile/feedback_screen.dart';
import 'package:ureport_ecaro/view/screens/account/profile/language_screen.dart';
import 'package:ureport_ecaro/view/screens/account/profile/menu_view.dart';
import 'package:ureport_ecaro/view/screens/account/profile/profile_view.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/article/article_list_screen.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/article/article_screen.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/article/articles_category_screen.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/article/category_list.dart';
import 'package:ureport_ecaro/view/screens/chat/chat_screen.dart';
import 'package:ureport_ecaro/view/screens/home/home_screen.dart';
import 'package:ureport_ecaro/view/screens/onboarding/onboarding_screen.dart';
import 'package:ureport_ecaro/view/screens/open_app/open_app_screen.dart';
import 'package:ureport_ecaro/view/screens/opinions/opinion_screen.dart';
import 'package:ureport_ecaro/view/screens/splash_screen/splash_screen.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    // Root
    AdaptiveRoute(page: RootPage, children: [
      AdaptiveRoute(page: MenuScreen),
      AdaptiveRoute(page: ChatScreen),
      AdaptiveRoute(page: CategoryListScreen),
      AdaptiveRoute(page: HomeScreen),
      AdaptiveRoute(page: OpinionScreen),
    ]),
    // More

    AdaptiveRoute(page: AboutScreen),
    AdaptiveRoute(page: ProfileSettingsScreen),
    AdaptiveRoute(page: LanguageScreen),
    AdaptiveRoute(page: FeedbackScreen),

    // Chat

    // Profile
    AdaptiveRoute(page: SplashScreen, initial: true),
    AdaptiveRoute(page: ProfileScreen),
    AdaptiveRoute(page: RegisterScreen),
    AdaptiveRoute(page: LoginScreen),
    AdaptiveRoute(page: ForgotPasswordScreen),
    AdaptiveRoute(page: OpenAppScreen),
    AdaptiveRoute(page: OnboardingScreen),
    // Category Article Flow

    AdaptiveRoute(page: ArticlesCategoryScreen),
    AdaptiveRoute(page: ArticleScreen),
    AdaptiveRoute(page: ArticleListScreen),
    // HOME

    // Opinions
  ],
)
class $AppRouter {}
