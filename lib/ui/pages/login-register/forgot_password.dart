import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/ui/pages/login-register/components/code_component.dart';
import 'package:ureport_ecaro/ui/pages/login-register/components/login_register_widgets.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';
import 'package:ureport_ecaro/ui/shared/text_navigator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/translation.dart';
import 'package:validators/validators.dart' as validator;

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _newPwController = TextEditingController();
  final _confirmPwController = TextEditingController();
  final _codeController = List.of([
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ]);
  late StateStore _stateStore;
  late Map<String, String> _translation;

  var _pwError;
  var _confirmPwError;
  var _emailError;
  var _codeError;

  int page = 0;

  bool _isLoading = false;

  @override
  void initState() {
    _stateStore = context.read<StateStore>();

    _translation = translations["${_stateStore.selectedLanguage}"]![
        "forgot_password_screen"]!;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _newPwController.dispose();
    _confirmPwController.dispose();
    _codeController.forEach((element) {
      element.dispose();
    });
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
              page == 0
                  ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 80, left: 10, right: 10),
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
                          controller: _emailController,
                          errorText: _emailError,
                        ),
                        MainAppButtonComponent(
                          title: _translation["submit1"]!,
                          onPressed: sendCode,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    )
                  : page == 1
                      ? Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 80, left: 10, right: 10),
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
                              codeControllers: _codeController,
                            ),
                            Text(
                              _codeError ?? "",
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
                                        color: Color.fromRGBO(159, 75, 152, 1),
                                      )),
                                ],
                              ),
                            ),
                            MainAppButtonComponent(
                              title: _translation["submit2"]!,
                              onPressed: verifyCode,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 80, left: 10, right: 10),
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
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              controller: _newPwController,
                              errorText: _pwError,
                            ),
                            textField(
                              label: "Confirmare parolă nouă",
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              controller: _confirmPwController,
                              errorText: _confirmPwError,
                            ),
                            MainAppButtonComponent(
                              title: _translation["submit3"]!,
                              onPressed: resetPassword,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
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

  void toggleIsLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> verifyCode() async {
    if (_codeController[0].text.length == 0 ||
        _codeController[1].text.length == 0 ||
        _codeController[2].text.length == 0 ||
        _codeController[3].text.length == 0 ||
        _codeController[4].text.length == 0 ||
        _codeController[5].text.length == 0) {
      setState(() {
        _codeError = "Codul introdus este invalid";
      });
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _codeError = null;
        });
      });
      return;
    } else {
      setState(() {
        page = 2;
      });
    }
  }

  Future<void> sendCode() async {
    if (!validator.isEmail(_emailController.text)) {
      setState(() {
        _emailError = _translation["invalid_email"]!;
      });
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _emailError = null;
        });
      });
      return;
    } else {
      setState(() {
        _emailError = null;
        page = 1;
      });
    }
  }

  Future<void> resetPassword() async {
    if (_newPwController.text.length < 6) {
      setState(() {
        _pwError = "Parola este prea scurtă";
      });
      return;
    } else {
      setState(() {
        _pwError = null;
      });
    }
    if (_newPwController.text != _confirmPwController.text) {
      setState(() {
        _confirmPwError = "Parolele nu se potrivesc";
      });
      return;
    } else {
      setState(() {
        _confirmPwError = null;
      });
    }

    toggleIsLoading();

    // await FirebaseApis().resetPassword(
    //   email: _emailController.text,
    // );

    showPopup(
      context: context,
      type: 'pwrecover',
      onPressed: () => context.router.replace(LoginScreenRoute()),
      message: _translation["succes"]!,
      buttonText: _translation["continue"]!,
    );
  }
}
