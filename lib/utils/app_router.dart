import 'package:auto_route/auto_route.dart';
import 'package:ureport_ecaro/view/screens/account/login-register/forgot_password.dart';
import 'package:ureport_ecaro/view/screens/account/login-register/login.dart';
import 'package:ureport_ecaro/view/screens/account/login-register/register.dart';
import 'package:ureport_ecaro/view/screens/account/profile/about_view.dart';
import 'package:ureport_ecaro/view/screens/account/profile/change_pw_view.dart';

import 'package:ureport_ecaro/view/screens/account/profile/language_screen.dart';
import 'package:ureport_ecaro/view/screens/account/profile/menu_view.dart';
import 'package:ureport_ecaro/view/screens/account/profile/profile_view.dart';
import 'package:ureport_ecaro/view/screens/onboarding/onboarding_screen.dart';
import 'package:ureport_ecaro/view/screens/open_app/open_app_screen.dart';

import '../view/screens/splash_screen/splash_screen.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute(page: SplashScreen, initial: true),
    AdaptiveRoute(page: RegisterScreen),
    AdaptiveRoute(page: LoginScreen),
    AdaptiveRoute(page: ForgotPasswordScreen),
    AdaptiveRoute(page: AboutScreen),
    AdaptiveRoute(page: ChangePasswordScreen),
    AdaptiveRoute(page: LanguageScreen),
    AdaptiveRoute(page: MenuScreen),
    AdaptiveRoute(page: ProfileScreen),
    AdaptiveRoute(page: OpenAppScreen),
    AdaptiveRoute(page: OnboardingScreen),
  ],
)
class $AppRouter {}
