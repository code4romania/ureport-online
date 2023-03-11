import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/constants.dart';
import 'package:ureport_ecaro/utils/hex_colors_utils.dart';
import 'package:ureport_ecaro/utils/snackbar_controller.dart';
import '../../shared/general_button_component.dart';
import '../../shared/text_navigator_component.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key, required this.translations});
  final Map<String, String> translations;

  @override
  Widget build(BuildContext context) {
    final _state = context.read<StateStore>();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopHeaderWidget(title: translations["header"]!),
          TextNavigatorComponent(
            title: translations["back"]!,
            onPressed: () => context.router.pop(),
            rightEdge: false,
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            child: Text(
              translations["title"]!,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              translations["body"]!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Text(
                translations["reset_required"]!,
                style: TextStyle(
                  color: Colors.red,
                ),
              )),
          Column(
            children: _state.languages.entries.map((e) {
              return Observer(
                builder: ((context) {
                  return Row(
                    children: [
                      Radio(
                        value: e.key,
                        groupValue: _state.selectedLanguage,
                        activeColor: blueColor,
                        onChanged: (value) {
                          if (translations[e.key] == null) {
                            SnackbarController(
                              context: context,
                              message: "This language is not supported yet",
                            ).show();
                          } else {
                            if (_state.selectedLanguage != e.key) {
                              _state.changeLanguage(e.key);
                              context.router.replaceAll([RootPageRoute()]);
                            }
                          }
                        },
                      ),
                      GestureDetector(
                          onTap: () {
                            if (translations[e.key] == null) {
                              SnackbarController(
                                context: context,
                                message: "This language is not supported yet",
                              ).show();
                            } else {
                              if (_state.selectedLanguage != e.key) {
                                _state.changeLanguage(e.key);
                                context.router.replaceAll([RootPageRoute()]);
                              }
                            }
                          },
                          child: Text(e.value)),
                    ],
                  );
                }),
              );
            }).toList(),
          ),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(
              "assets/images/unicef_about.svg",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
