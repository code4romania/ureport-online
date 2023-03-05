import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/services/click_sound_service.dart';
import 'package:ureport_ecaro/utils/translation.dart';

import '../../../controllers/app_router.gr.dart';
import '../../shared/top_header_widget.dart';
import 'components/profile_header_component.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late StateStore _stateStore;
  late Map<String, String> _translation;

  @override
  void initState() {
    _stateStore = context.read<StateStore>();

    _translation =
        translations["${_stateStore.selectedLanguage}"]!["menu_screen"]!;

    print(_translation.length);
    print(_translation["header"]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            TopHeaderWidget(title: _translation["header"] ?? "Menu"),
            ProfileHeaderComponent(),
            ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  menuItem(
                    context,
                    _translation["about"]!,
                    () => context.router.push(
                      AboutScreenRoute(
                        translations:
                            translations["${_stateStore.selectedLanguage}"]![
                                "about_screen"]!,
                      ),
                    ),
                  ),
                  menuItem(
                    context,
                    _translation["profile"]!,
                    () => context.router.push(
                      ProfileScreenRoute(
                        translation:
                            translations["${_stateStore.selectedLanguage}"]![
                                "profile_screen"]!,
                      ),
                    ),
                  ), //NavUtils.push(context, ProfileScreen())),
                  menuItem(
                    context,
                    _translation["feedback"]!,
                    () => context.router.push(
                      FeedbackScreenRoute(
                        translations:
                            translations["${_stateStore.selectedLanguage}"]![
                                "feedback_screen"]!,
                      ),
                    ),
                  ), //NavUtils.push(context, ProgramChooser())),
                  menuItem(
                    context,
                    _translation["language"]!,
                    () => context.router.push(
                      LanguageScreenRoute(
                        translations:
                            translations["${_stateStore.selectedLanguage}"]![
                                "language_screen"]!,
                      ),
                    ),
                  ),

                  menuItem(
                    context,
                    _translation["account"]!,
                    () => context.router.push(
                      AccountScreenRoute(),
                    ),
                  ), //NavUtils.push(context, ChangePasswordScreen())),
                  menuItem(
                    context,
                    _translation["notifications"]!,
                    () => context.router.push(
                      NotificationScreenRoute(
                        translations:
                            translations["${_stateStore.selectedLanguage}"]![
                                "notification_screen"]!,
                      ),
                    ),
                  ), //NavUtils.push(context, NotificationsScreen())),
                ]),
          ],
        ),
      )),
    );
  }

  /*
     region != null && region!.toLowerCase().startsWith('ro')
                    ? GestureDetector(
                        onTap: () {
                          var spset = locator<SPUtil>();

                          ClickSound.soundClick();

                          FirebaseAuth.instance.signOut();
                          spset.deleteKey(SPUtil.PROGRAMKEY);
                          spset.deleteKey(SPConstant.SELECTED_LANGUAGE);
                          NavUtils.pushAndRemoveUntil(
                              context, LanguageChooser());
                        },
                        child: getItem(
                            "Ieși din cont", "assets/images/v2_ic_program.png"),
                      )
                    : SizedBox(),
  */
  Widget menuItem(BuildContext context, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        ClickSound.soundClick();
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 100,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            color: Color.fromRGBO(28, 171, 226, 1),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10))),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
