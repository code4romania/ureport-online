import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/forgot_password_store.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/ui/pages/login-register/components/code_component.dart';
import 'package:ureport_ecaro/ui/pages/login-register/components/login_register_widgets.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
import 'package:ureport_ecaro/ui/shared/text_navigator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/enums.dart';
import 'package:ureport_ecaro/utils/translation.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late StateStore _stateStore;
  late ForgotPasswordStore _forgotPasswordStore;
  late Map<String, String> _translation;

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _translation = translations["${_stateStore.selectedLanguage}"]![
        "forgot_password_screen"]!;
    _forgotPasswordStore = ForgotPasswordStore(_translation);

    super.initState();

    reaction((p0) => _forgotPasswordStore.errorMessage != null, (p0) {
      showPopup(
        context: context,
        message: _forgotPasswordStore.errorMessage!,
        onPressed: () => context.router.pop(),
        buttonText: _translation["retry"]!,
      );
    });

    reaction((p0) => _forgotPasswordStore.result != null, (p0) {
      if (_forgotPasswordStore.result == ForgotPasswordStatus.SUCCESS) {
        showPopup(
          context: context,
          message: _translation["succes_title"]!,
          onPressed: () => context.router.pop(),
          buttonText: _translation["continue"]!,
        );
      } else {
        showPopup(
          context: context,
          message: _forgotPasswordStore.errorMessage!,
          onPressed: () => context.router.pop(),
          buttonText: _translation["retry"]!,
        );
        //TOOD: GOTO LOGIN SCREEN
      }
    });
  }

  @override
  void dispose() {
    _forgotPasswordStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: TopHeaderWidget(title: _translation["header"]!),
              ),
              TextNavigatorComponent(
                title: _translation["back"]!,
                rightEdge: false,
                onPressed: () => context.router.pop(),
              ),
              Observer(builder: (context) {
                return _forgotPasswordStore.page == 0
                    ? Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 80, left: 10, right: 10),
                            width: double.infinity,
                            child: Text(
                              _translation["title1"]!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 28,
                                  fontFamily: 'Heebo'),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            width: double.infinity,
                            child: Text(
                              _translation["body1"]!,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          textField(
                            label: _translation["email"]!,
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            controller: _forgotPasswordStore.emailController,
                            errorText: _forgotPasswordStore.emailError,
                          ),
                          _forgotPasswordStore.isLoading
                              ? Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: LoadingIndicatorComponent(),
                                )
                              : MainAppButtonComponent(
                                  title: _translation["submit1"]!,
                                  onPressed: _forgotPasswordStore.sendCode,
                                ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    : _forgotPasswordStore.page == 1
                        ? Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 80, left: 10, right: 10),
                                width: double.infinity,
                                child: Text(
                                  _translation["title2"]!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 28,
                                      fontFamily: 'Heebo'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30, right: 30),
                                width: double.infinity,
                                child: Text(
                                  _translation["body2"]!,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              CodeComponent(
                                codeControllers:
                                    _forgotPasswordStore.codeController,
                              ),
                              Text(
                                _forgotPasswordStore.codeError ?? "",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                  text: _translation["no_code"]! + " ",
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: _translation["resend"]!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(159, 75, 152, 1),
                                        )),
                                  ],
                                ),
                              ),
                              _forgotPasswordStore.isLoading
                                  ? Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: LoadingIndicatorComponent(),
                                    )
                                  : MainAppButtonComponent(
                                      title: _translation["submit2"]!,
                                      onPressed:
                                          _forgotPasswordStore.verifyCode,
                                    ),
                            ],
                          )
                        : Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 80, left: 10, right: 10),
                                width: double.infinity,
                                child: Text(
                                  _translation["title3"]!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 28,
                                      fontFamily: 'Heebo'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30, right: 30),
                                width: double.infinity,
                                child: Text(
                                  _translation["body3"]!,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              textField(
                                label: "Parola nouă",
                                textInputAction: TextInputAction.next,
                                obscureText: true,
                                keyboardType: TextInputType.emailAddress,
                                controller:
                                    _forgotPasswordStore.newPasswordController,
                                errorText: _forgotPasswordStore.passwordError,
                              ),
                              textField(
                                label: "Confirmare parolă nouă",
                                textInputAction: TextInputAction.next,
                                obscureText: true,
                                keyboardType: TextInputType.emailAddress,
                                controller: _forgotPasswordStore
                                    .confirmPasswordController,
                                errorText:
                                    _forgotPasswordStore.confirmPasswordError,
                              ),
                              _forgotPasswordStore.isLoading
                                  ? Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: LoadingIndicatorComponent(),
                                    )
                                  : MainAppButtonComponent(
                                      title: _translation["submit3"]!,
                                      onPressed: () async {
                                        await _forgotPasswordStore
                                            .resetPassword();
                                        context.router
                                            .replace(LoginScreenRoute());
                                      },
                                    ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          );
              }),
              GestureDetector(
                onTap: () => context.router.replace(LoginScreenRoute()),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    text: _translation["known_account"]! + " ",
                    children: <TextSpan>[
                      TextSpan(
                          text: _translation["go_to_login"]!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(159, 75, 152, 1),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
