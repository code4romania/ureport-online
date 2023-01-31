import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/data/secure_storage.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/utils/click_sound.dart';
import 'package:ureport_ecaro/utils/enums.dart';
import 'package:ureport_ecaro/view/screens/account/login-register/login_register_widgets.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/shared/top_header_widget.dart';
import 'package:validators/validators.dart' as validator;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwdController = TextEditingController();
  var _emailError;
  var _passwordError;

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
        TopHeaderWidget(title: "AUTENTIFICARE"),
        Container(
            margin: EdgeInsets.only(top: 80, left: 10),
            width: double.infinity,
            child: Text(
              "AUTENTIFICĂ-TE",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  fontFamily: 'Heebo'),
            )),
        Container(
          width: double.infinity,
          height: 40,
          margin: EdgeInsets.only(right: 30, left: 30, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: submitButton(
                    type: 'google',
                    onPressed: () {
                      print("google");
                    }),
              ),
              Expanded(
                child: submitButton(
                    type: 'facebook',
                    onPressed: () {
                      print("facebook");
                    }),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    child: Divider(
                      color: Colors.black,
                    )),
                Text("SAU"),
                Container(
                    width: 100,
                    child: Divider(
                      color: Colors.black,
                    )),
              ],
            )),
        textField(
          label: "Email",
          textInputAction: TextInputAction.next,
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
          errorText: _emailError,
        ),
        textField(
          label: "Password",
          textInputAction: TextInputAction.done,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          controller: _passwdController,
          errorText: _passwordError,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 16, left: 16, top: 20),
          height: 44,
          child: _isLoading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )
              : submitButton(
                  type: 'login',
                  onPressed: () async => await login(),
                ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
            onTap: () => context.router.replace(ForgotPasswordScreenRoute()),
            child: Text("Ai uitat parola?")),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () => context.router.replace(RegisterScreenRoute()),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              text: 'Nu ai cont? ',
              children: const <TextSpan>[
                TextSpan(
                    text: 'Înregistrează-te',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue)),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 30,
        ),
      ]),
    )));
  }

  void toggleIsLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> login() async {
    if (!validator.isEmail(_emailController.text)) {
      setState(() {
        _emailError = "Email invalid";
      });
      return;
    } else {
      setState(() {
        _emailError = null;
      });
    }

    if (_passwdController.text.length < 6) {
      setState(() {
        _passwordError = "Parola este prea scurtă";
      });
      return;
    } else {
      setState(() {
        _passwordError = null;
      });
    }
    toggleIsLoading();

    final signInResult = LoginStatus.SUCCESS; //await FirebaseApis().signIn(
    //   email: _emailController.text,
    //   password: _passwdController.text,
    // );

    if (signInResult == LoginStatus.SUCCESS) {
      toggleIsLoading();

      showPopup(
        context: context,
        type: 'login',
        onPressed: () {
          //TODO: GET TOKEN FROM REMOTE AND SET TO STORAGE
          StorageUtil.setString("token", "############");
          context.router.replaceAll([RootPageRoute()]);
        },
      );
    } else if (signInResult == LoginStatus.NOT_FOUND) {
      toggleIsLoading();

      showPopup(
          context: context,
          type: 'error',
          message: "Acest cont nu exista!",
          onPressed: () => Navigator.pop(context));
    } else if (signInResult == LoginStatus.WRONG_DETAILS) {
      toggleIsLoading();

      showPopup(
          context: context,
          type: 'error',
          message: "Detaliile introduse nu sunt corecte!",
          onPressed: () => Navigator.pop(context));
    } else {
      toggleIsLoading();

      showPopup(
          context: context,
          type: 'error',
          message: "S-a produs o eroare!",
          onPressed: () => Navigator.pop(context));
    }
  }
}
