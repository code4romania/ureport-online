import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/utils/hex_colors_utils.dart';
import 'package:ureport_ecaro/view/screens/onboarding/onboarding_screen.dart';
import 'package:ureport_ecaro/view/shared/general_button_component.dart';
import 'package:ureport_ecaro/view_model/state_store.dart';

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
            child: Image.asset("assets/images/ureport_romania_landscape.png")),
        SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: PageView(
            controller: _controller,
            children: [
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.select_language,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: _state.languages.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Observer(
                          builder: ((context) {
                            return Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 80,
                                child: RadioListTile(
                                  title: Text(
                                    _state.languages[index],
                                    style: TextStyle(
                                        color: _state.selectedLanguage ==
                                                _state.languages[index]
                                            ? HexColor.selectedChoiceColor
                                            : Colors.black),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: index == 0
                                          ? BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            )
                                          : index == _state.languages.length - 1
                                              ? BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                )
                                              : BorderRadius.circular(0)),
                                  subtitle: _state.languages[index] == "Română"
                                      ? Text(
                                          "This project would be available to anyone who has the link",
                                          style: TextStyle(
                                            color: _state.selectedLanguage ==
                                                    _state.languages[index]
                                                ? HexColor.secondaryChoiceColor
                                                : Colors.black,
                                          ),
                                        )
                                      : Text(
                                          "You are the only one able to access this project",
                                          style: TextStyle(
                                            color: _state.selectedLanguage ==
                                                    _state.languages[index]
                                                ? HexColor.secondaryChoiceColor
                                                : Colors.black,
                                          ),
                                        ),
                                  value: _state.languages[index],
                                  activeColor:
                                      HexColor.secondaryPurpleChoiceColor,
                                  tileColor: _state.selectedLanguage ==
                                          _state.languages[index]
                                      ? Color.fromRGBO(199, 210, 254, 1)
                                      : Colors.white,
                                  groupValue: _state.selectedLanguage,
                                  onChanged: (value) {
                                    _state.setLocale(
                                        Locale(_state.languages[index]));
                                    _state.selectedLanguage =
                                        _state.languages[index];
                                  },

                                  // child: ListTile(
                                  //   title: Text(
                                  //     _state.languages[index],
                                  //     style: TextStyle(
                                  //         color: _state.selectedLanguage ==
                                  //                 _state.languages[index]
                                  //             ? Colors.blue
                                  //             : Colors.black),
                                  //   ),
                                  //   onTap: () {
                                  //     _state.setLocale(
                                  //         Locale(_state.languages[index]));
                                  //     _state.selectedLanguage =
                                  //         _state.languages[index];
                                  //     _controller.nextPage(
                                  //         duration: Duration(milliseconds: 500),
                                  //         curve: Curves.easeIn);
                                  //   },
                                  // ),
                                ));
                          }),
                        );
                      })
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      AppLocalizations.of(context)!.onopenapp,
                      style: TextStyle(
                          fontSize: 18,
                          height: 1.5,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        MainAppButtonComponent(
            title: AppLocalizations.of(context)!.continu,
            onPressed: () {
              if (_controller.page == 1) {
                context.router.push(OnboardingScreenRoute());
              } else {
                _controller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              }
            }),
      ]),
    );
  }
}
