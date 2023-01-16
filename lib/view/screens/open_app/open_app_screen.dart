import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/view/screens/onboarding/onboarding_screen.dart';
import 'package:ureport_ecaro/view/shared/general_button_component.dart';

class OpenAppScreen extends StatelessWidget {
  const OpenAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
            child: Image.asset("assets/images/ureport_romania_landscape.png")),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                AppLocalizations.of(context)!.onopenapp,
                style: TextStyle(
                    fontSize: 18, height: 1.5, fontWeight: FontWeight.w400),
              ),
            ),
            MainAppButtonComponent(
              title: AppLocalizations.of(context)!.continu,
              onPressed: () => context.router.push(OnboardingScreenRoute()),
            ),
          ],
        ),
      ]),
    );
  }
}
