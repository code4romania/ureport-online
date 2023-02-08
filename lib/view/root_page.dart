import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(context) {
    return AutoTabsScaffold(
      routes: [
        CategoryListScreenRoute(),
        ChatRoute(from: "Home"),
        HomeScreenRoute(),
        OpinionScreenRoute(),
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
            selectedIconTheme:
                IconThemeData(color: Color.fromRGBO(28, 171, 226, 1), size: 28),
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
}
