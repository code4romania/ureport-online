import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/view/screens/onboarding/onboarding_screen.dart';
import 'package:ureport_ecaro/view/shared/general_button_component.dart';

class OpenAppScreen extends StatefulWidget {
  const OpenAppScreen({super.key});

  @override
  State<OpenAppScreen> createState() => _OpenAppScreenState();
}

class _OpenAppScreenState extends State<OpenAppScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            child: Image.asset("assets/images/ureport_romania_landscape.png")),
        SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
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
          onPressed: () => context.router.push(OnboardingScreenRoute()),
        ),
      ]),
    );
  }
}
