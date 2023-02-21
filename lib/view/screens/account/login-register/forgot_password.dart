import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/data/translation.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/view/screens/account/login-register/login_register_widgets.dart';
import 'package:ureport_ecaro/view/shared/general_button_component.dart';
import 'package:ureport_ecaro/view/shared/top_header_widget.dart';
import 'package:ureport_ecaro/view_model/state_store.dart';

import 'package:validators/validators.dart' as validator;

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _newPwController = TextEditingController();
  final _confirmPwController = TextEditingController();
  late StateStore _stateStore;
  late Map<String, String> _translation;

  var _pwError;
  var _confirmPwError;
  var _emailError;
  var _codeError;
  bool _codeSent = false;

  bool _isLoading = false;

  @override
  void initState() {
    _stateStore = context.read<StateStore>();

    _translation = translations["${_stateStore.selectedLanguage}"]![
        "forgot_password_screen"]!;
    super.initState();
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
              Container(
                margin: EdgeInsets.only(top: 80, left: 10, right: 10),
                width: double.infinity,
                child: Text(
                  _codeSent ? _translation["title2"]! : _translation["title1"]!,
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
                  _codeSent ? _translation["body2"]! : _translation["body1"]!,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              _codeSent
                  ? SizedBox()
                  : textField(
                      label: _translation["email"]!,
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      errorText: _emailError,
                    ),
              _codeSent
                  ? textField(
                      label: "Parola nouă",
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: _newPwController,
                      errorText: _pwError,
                    )
                  : SizedBox(),
              _codeSent
                  ? textField(
                      label: "Confirmare parolă nouă",
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: _confirmPwController,
                      errorText: _confirmPwError,
                    )
                  : SizedBox(),
              _codeSent
                  ? textField(
                      label: "Cod primit",
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _codeController,
                      errorText: _codeError,
                    )
                  : SizedBox(),
              _codeSent
                  ? MainAppButtonComponent(
                      title: _translation["submit2"]!,
                      onPressed: resetPassword,
                    )
                  : MainAppButtonComponent(
                      title: _translation["submit1"]!,
                      onPressed: sendCode,
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
                    text: _translation["known_account"]! + "",
                    children: <TextSpan>[
                      TextSpan(
                          text: _translation["go_to_login"]!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
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

  Future<void> sendCode() async {
    //SEND EMAIL ROUTE
    setState(() {
      _codeSent = true;
    });
  }

  Future<void> resetPassword() async {
    if (_codeSent) {
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
      if (!validator.isEmail(_emailController.text)) {
        setState(() {
          _emailError = _translation["invalid_email"]!;
        });
        return;
      } else {
        setState(() {
          _emailError = null;
        });
      }
      toggleIsLoading();

      // await FirebaseApis().resetPassword(
      //   email: _emailController.text,
      // );

      showPopup(
          context: context,
          type: 'pwrecover',
          onPressed: () => context.router.replace(LoginScreenRoute()));
    }
  }
}
