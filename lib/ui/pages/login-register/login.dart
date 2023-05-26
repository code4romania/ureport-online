import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/login_store.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/ui/pages/login-register/components/login_register_widgets.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/translation.dart';
import '../../../utils/constants.dart';
import '../../../utils/enums.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late StateStore _stateStore;
  late LoginStore _loginStore;
  late Map<String, String> _translation;

  @override
  void dispose() {
    _loginStore.dispose();
    super.dispose();
  }
  // ***** GOOGLE LOGIN *****
  // open webview with url
  // receive token from google login
  // call endpoint to login with received token
  // if success, save token in shared preferences

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _translation =
        translations["${_stateStore.selectedLanguage}"]!["login_screen"]!;
    _loginStore = LoginStore(_translation);

    super.initState();

    reaction((p0) => _loginStore.result != null, (p0) {
      switch (_loginStore.result) {
        case LoginStatus.SUCCESS:
          {
            _loginStore.getProfile().then((value) {
              _stateStore.updateProfile(value);
              context.router.replaceAll([RootPageRoute()]);
              // showPopup(
              //   context: context,
              //   onPressed: () => context.router.replaceAll([RootPageRoute()]),
              //   buttonText: _translation["continue"]!,
              //   message: _translation["succes"]!,
              // );
            });

            break;
          }
        case LoginStatus.ERROR:
          showPopup(
            context: context,
            message: _loginStore.errorMessage.toString(),
            buttonText: _translation["continue"]!,
            onPressed: () => context.router.pop(),
          );
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeaderWidget(title: _translation["header"]!),
            Container(
              margin: EdgeInsets.only(top: 80, left: 10, right: 10),
              width: double.infinity,
              child: Text(
                _translation["title"]!,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  fontFamily: 'Heebo',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => context.router.replace(RegisterScreenRoute()),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  text: _translation["no_account"]! + " ",
                  children: <TextSpan>[
                    TextSpan(
                        text: _translation['no_account2']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: purpleColor,
                        )),
                  ],
                ),
              ),
            ),
            Observer(builder: (context) {
              return textField(
                label: _translation["email"]!,
                textInputAction: TextInputAction.next,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                controller: _loginStore.emailController,
                errorText: _loginStore.emailError,
              );
            }),
            Observer(builder: (context) {
              return textField(
                label: _translation["password"]!,
                textInputAction: TextInputAction.done,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                controller: _loginStore.passwdController,
                errorText: _loginStore.passwordError,
              );
            }),
            Observer(builder: (context) {
              return _loginStore.isLoading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LoadingIndicatorComponent(),
                    )
                  : MainAppButtonComponent(
                      title: _translation["submit"]!,
                      onPressed: () => _loginStore.login(),
                    );
            }),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => context.router.replace(ForgotPasswordScreenRoute()),
              child: Text(
                _translation["forgot_pw"]!,
                style: TextStyle(
                  color: purpleColor,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 30),
            //   width: double.infinity,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //           width: 100,
            //           child: Divider(
            //             color: Colors.black,
            //           )),
            //       Text(_translation['separator_text']!),
            //       Container(
            //         width: 100,
            //         child: Divider(
            //           color: Colors.black,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 40,
            //   margin: EdgeInsets.only(right: 30, left: 30, top: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Expanded(
            //         child: submitButton(
            //             type: 'google',
            //             onPressed: () {
            //               print("google");
            //             }),
            //       ),
            //       Expanded(
            //         child: submitButton(
            //             type: 'facebook',
            //             onPressed: () {
            //               print("facebook");
            //             }),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
