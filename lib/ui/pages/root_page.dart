import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/story_state.dart';
import 'package:ureport_ecaro/utils/translation.dart';

import '../../controllers/app_router.gr.dart';
import '../../controllers/state_store.dart';
import '../../utils/sp_utils.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});
  late StateStore _store;

  void setInitialLocal() {
    String? localeLanguage = SPUtil().getValue(SPUtil.KEY_USER_LANGUAGE);

    print(localeLanguage);

    if (localeLanguage == "ro" || localeLanguage.isEmpty) {
      print("Nu exista limba aleasa, continuam cu Romana");
      _store.selectedLanguage = "ro";
      SPUtil().setValue(SPUtil.KEY_USER_LANGUAGE, "ro");
    } else if (localeLanguage == "uk") {
      if (translations["uk"] == null) {
        _store.selectedLanguage = "ro";
        print("Nu exista traducerea pentru limba ucrainiana");
        SPUtil().setValue(SPUtil.KEY_USER_LANGUAGE, "ro");
      } else {
        _store.selectedLanguage = "uk";
        SPUtil().setValue(SPUtil.KEY_USER_LANGUAGE, "uk");
      }
    }
  }

  Future<void> splash() async {
    // return Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(context) {
    _store = context.read<StateStore>();
    return FutureBuilder(
      future: splash(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(235, 249, 255, 1),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/images/logo_ureport_2.png",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/images/logo_ureport_3.png",
                    ),
                    CircularProgressIndicator(
                      color: Color.fromRGBO(28, 171, 226, 1),
                    ),
                  ]),
            ),
          );
        } else {
          setInitialLocal();
          String? token = SPUtil().getValue("token");

          if (token.isEmpty) {
            context.router.replaceAll([OpenAppScreenRoute()]);
          } else {
            return AutoTabsScaffold(
              homeIndex: 2,
              routes: [
                CategoryListScreenRoute(),
                ChatRoute(from: "home"),
                HomeScreenRoute(),
                OpinionRoute(),
                MenuScreenRoute(),
              ],
              bottomNavigationBuilder: (_, tabsRouter) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: Color.fromRGBO(28, 171, 226, 0.5),
                  ),
                  child: BottomNavigationBar(
                    currentIndex: tabsRouter.activeIndex,
                    onTap: tabsRouter.setActiveIndex,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    unselectedItemColor: Color.fromRGBO(28, 171, 226, 1),
                    selectedItemColor: Color.fromRGBO(28, 171, 226, 1),
                    enableFeedback: true,
                    iconSize: 26,
                    selectedIconTheme: IconThemeData(
                        color: Color.fromRGBO(28, 171, 226, 1), size: 28),
                    items: [
                      BottomNavigationBarItem(
                        icon: Image.asset("assets/images/icon_article.png"),
                        label: 'Articole',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset("assets/images/icon_chat.png"),
                        label: 'Chat',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset("assets/images/icon_home.png"),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset("assets/images/icon_opinions.png"),
                        label: 'Opinii',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.menu_outlined),
                        label: 'Mai multe',
                      ),
                    ],
                  ),
                );
              },
            );
          }
        }
        return Container();
      },
    );
  }
}
