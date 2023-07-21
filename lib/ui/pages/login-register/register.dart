import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/register_store.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/ui/pages/login-register/components/login_register_widgets.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/translation.dart';

import '../../../utils/enums.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late StateStore _stateStore;
  late RegisterStore _registerStore;
  late Map<String, String> _translation;

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _translation =
        translations["${_stateStore.selectedLanguage}"]!["register_screen"]!;
    _registerStore = RegisterStore(_translation);

    super.initState();

    reaction((p0) => _registerStore.result != null, (p0) {
      if (_registerStore.result == RegisterStatus.SUCCESS) {
        _registerStore.getProfile().then((value) {
          _stateStore.updateProfile(value);
          showPopup(
            context: context,
            onPressed: () => context.router.replaceAll([RootPageRoute()]),
            buttonText: _translation["continue"]!,
            message: _translation["succes"]!,
          );
        });
        // Check if message is !null
        // Sometimes if response == 400 it showed a dialog with null message
      } else if (_registerStore.errorMessage != null) {
        showPopup(
          context: context,
          onPressed: () => context.router.pop(),
          message: _registerStore.errorMessage.toString(),
          buttonText: _translation["continue"]!,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        fontFamily: 'Heebo'),
                    textAlign: TextAlign.center,
                  )),
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
              // Container(
              //     margin: EdgeInsets.only(top: 30),
              //     width: double.infinity,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Container(
              //             width: 100,
              //             child: Divider(
              //               color: Colors.black,
              //             )),
              //         Text(_translation["separator_text"]!),
              //         Container(
              //             width: 100,
              //             child: Divider(
              //               color: Colors.black,
              //             )),
              //       ],
              //     )),
              Observer(builder: (context) {
                return textField(
                  label: _translation["username"]!,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  controller: _registerStore.nameController,
                  errorText: _registerStore.nameError,
                );
              }),
              Observer(builder: (context) {
                return textField(
                  label: _translation["email"]!,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: _registerStore.emailController,
                  errorText: _registerStore.emailError,
                );
              }),
              Observer(builder: (context) {
                return textField(
                  label: _translation["password"]!,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: _registerStore.passwdController,
                  errorText: _registerStore.passwordError,
                );
              }),
              Observer(builder: (context) {
                return textField(
                  label: _translation["confirm_password"]!,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: _registerStore.confirmPwController,
                  errorText: _registerStore.confirmPwError,
                );
              }),
              Observer(
                builder: (context) => _registerStore.isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LoadingIndicatorComponent(),
                      )
                    : MainAppButtonComponent(
                        title: _translation["submit"]!,
                        onPressed: () async => _registerStore.register(),
                      ),
              ),

              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => context.router.replace(LoginScreenRoute()),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    text: _translation['already_have_account']! + " ",
                    children: <TextSpan>[
                      TextSpan(
                        text: _translation["go_to_login"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(159, 75, 152, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
