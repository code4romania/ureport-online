import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/category_stories_store.dart';
import 'package:ureport_ecaro/services/click_sound_service.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
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
    return Future.delayed(Duration(seconds: 2));
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
                  ]),
            ),
          );
        } else {
          setInitialLocal();
          String? token = SPUtil().getValue(SPUtil.KEY_AUTH_TOKEN);

          if (token.isEmpty) {
            context.router.replaceAll([OpenAppScreenRoute()]);
          } else {
            return AutoTabsScaffold(
              extendBody: true,
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
                    onTap: (index) {
                      ClickSound.soundClick();
                      tabsRouter.setActiveIndex(index);
                    },
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    unselectedItemColor: Color.fromRGBO(28, 171, 226, 1),
                    selectedItemColor: Color.fromRGBO(159, 75, 152, 1),
                    enableFeedback: true,
                    iconSize: 26,
                    selectedIconTheme:
                        IconThemeData(color: Color.fromRGBO(159, 75, 152, 1)),
                    items: [
                      BottomNavigationBarItem(
                        icon: Image.asset("assets/images/icon_article.png",
                            color: tabsRouter.activeIndex == 0
                                ? Color.fromRGBO(159, 75, 152, 1)
                                : Color.fromRGBO(28, 171, 226, 1)),
                        label: 'Articole',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset("assets/images/icon_chat.png",
                            color: tabsRouter.activeIndex == 1
                                ? Color.fromRGBO(159, 75, 152, 1)
                                : Color.fromRGBO(28, 171, 226, 1)),
                        label: 'Chat',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset("assets/images/icon_home.png",
                            color: tabsRouter.activeIndex == 2
                                ? Color.fromRGBO(159, 75, 152, 1)
                                : Color.fromRGBO(28, 171, 226, 1)),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset("assets/images/icon_opinions.png",
                            color: tabsRouter.activeIndex == 3
                                ? Color.fromRGBO(159, 75, 152, 1)
                                : Color.fromRGBO(28, 171, 226, 1)),
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
