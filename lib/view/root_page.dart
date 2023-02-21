import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ureport_ecaro/data/sp_utils.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/view_model/state_store.dart';

import 'screens/category_article_flow/articles_category_screen.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});
  late StateStore _store;

  void setInitialLocal() {
    String? localeLanguage = SPUtil().getValue("language");

    if (localeLanguage == "ro" || localeLanguage.isEmpty) {
      _store.selectedLanguage = "ro";
    } else if (localeLanguage == "ua") {
      _store.selectedLanguage = "ua";
    }
  }

  @override
  Widget build(context) {
    _store = StateStore();
    return Builder(builder: (context) {
      setInitialLocal();

      String? token = SPUtil().getValue("token");
      if (token.isEmpty) {
        context.router.replaceAll([OpenAppScreenRoute()]);
      } else {
        return AutoTabsScaffold(
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
                unselectedItemColor: Color.fromRGBO(28, 171, 226, 1),
                selectedItemColor: Color.fromRGBO(28, 171, 226, 1),
                enableFeedback: true,
                iconSize: 26,
                selectedIconTheme: IconThemeData(
                    color: Color.fromRGBO(28, 171, 226, 1), size: 28),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.article_outlined,
                    ),
                    label: 'Articole',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_outlined),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.question_answer_outlined),
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
      return CircularProgressIndicator();
    });
  }
}
