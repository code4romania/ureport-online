import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/view/screens/account/profile/components/profile_header_component.dart';
import 'package:ureport_ecaro/view/shared/top_header_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            TopHeaderWidget(title: "Meniu"),
            ProfileHeaderComponent(),
            ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  menuItem(
                      context,
                      "Despre",
                      () => context.router.push(
                          AboutScreenRoute())), //NavUtils.push(context, AboutScreen())),
                  menuItem(
                      context,
                      "Profilul tau",
                      () => context.router.push(
                          ProfileScreenRoute())), //NavUtils.push(context, ProfileScreen())),
                  menuItem(
                      context,
                      "Trimite feedback",
                      () => context.router.push(
                          FeedbackScreenRoute())), //NavUtils.push(context, ProgramChooser())),
                  // menuItem(
                  //     context,
                  //     "Schimba limba",
                  //     () => context.router.push(
                  //         LanguageScreenRoute())), // NavUtils.push(context, LanguageChooser())),
                  menuItem(
                      context,
                      "Setări cont",
                      () => context.router.push(
                          ProfileSettingsScreenRoute())), //NavUtils.push(context, ChangePasswordScreen())),
                  menuItem(context, "Notificari", () {
                    // var spset = locator<SPUtil>();

                    // ClickSound.soundClick();

                    // FirebaseAuth.instance.signOut();
                    // spset.deleteKey(SPUtil.PROGRAMKEY);
                    // spset.deleteKey(SPConstant.SELECTED_LANGUAGE);
                    // NavUtils.pushAndRemoveUntil(context, LanguageChooser());
                  }),
                  menuItem(context, "Sterge cont", () => {}), //null),
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
      onTap: onTap,
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
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
