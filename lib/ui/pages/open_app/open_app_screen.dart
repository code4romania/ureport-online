import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';
import 'package:ureport_ecaro/utils/snackbar_controller.dart';
import 'package:ureport_ecaro/utils/translation.dart';

import '../../../utils/constants.dart';
import '../../../utils/hex_colors_utils.dart';

class OpenAppScreen extends StatefulWidget {
  const OpenAppScreen({super.key});

  @override
  State<OpenAppScreen> createState() => _OpenAppScreenState();
}

class _OpenAppScreenState extends State<OpenAppScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final _state = context.read<StateStore>();

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20),
          child: Image.asset(
            "assets/images/ureport_romania_landscape.png",
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: PageView(
            controller: _controller,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Observer(builder: (context) {
                    return Text(
                      translations[_state.selectedLanguage]![
                          "open_app_screen"]!["choose_language"]!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  }),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: purpleColor,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: _state.languages.entries.map((e) {
                        return Observer(
                          builder: ((context) {
                            return Row(
                              children: [
                                Radio(
                                  value: e.key,
                                  groupValue: _state.selectedLanguage,
                                  activeColor: HexColor("#A72D6F"),
                                  onChanged: (value) {
                                    if (translations[e.key] == null) {
                                      SnackbarController(
                                        context: context,
                                        message:
                                            "This language is not supported yet",
                                      ).show();
                                      return;
                                    } else {
                                      _state.selectedLanguage = e.key;
                                    }
                                  },
                                ),
                                GestureDetector(
                                    onTap: () {
                                      if (translations[e.key] == null) {
                                        SnackbarController(
                                          context: context,
                                          message:
                                              "This language is not supported yet",
                                        ).show();
                                        return;
                                      } else {
                                        _state.changeLanguage(e.key);
                                      }
                                    },
                                    child: Text(e.value)),
                              ],
                            );
                          }),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: Observer(builder: (context) {
                      return Text(
                        translations[_state.selectedLanguage]![
                            "open_app_screen"]!["welcome_text"]!,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
        Observer(builder: (context) {
          return MainAppButtonComponent(
              title: translations[_state.selectedLanguage]!["open_app_screen"]![
                  "continue"]!,
              onPressed: () {
                if (_controller.page == 1) {
                  context.router.push(OnboardingScreenRoute());
                } else {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                }
              });
        }),
      ]),
    );
  }
}
