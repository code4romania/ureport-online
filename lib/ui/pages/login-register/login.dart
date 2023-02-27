import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/ui/pages/login-register/components/login_register_widgets.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
import 'package:ureport_ecaro/utils/translation.dart';
import 'package:validators/validators.dart' as validator;
import '../../../utils/constants.dart';
import '../../../utils/enums.dart';

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

  late StateStore _stateStore;
  late Map<String, String> _translation;

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwdController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _translation =
        translations["${_stateStore.selectedLanguage}"]!["login_screen"]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
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
        textField(
          label: _translation["email"]!,
          textInputAction: TextInputAction.next,
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
          errorText: _emailError,
        ),
        textField(
          label: _translation["password"]!,
          textInputAction: TextInputAction.done,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          controller: _passwdController,
          errorText: _passwordError,
        ),
        _isLoading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              )
            : MainAppButtonComponent(
                title: _translation["submit"]!,
                onPressed: () async => await login(),
              ),
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
                Text(_translation['separator_text']!),
                Container(
                    width: 100,
                    child: Divider(
                      color: Colors.black,
                    )),
              ],
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
        _emailError = _translation['invalid_email']!;
      });
      return;
    } else {
      setState(() {
        _emailError = null;
      });
    }

    if (_passwdController.text.length < 6) {
      setState(() {
        _passwordError = _translation['short_pw']!;
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
          SPUtil().setValue("token", "############");
          context.router.replaceAll([RootPageRoute()]);
        },
        buttonText: _translation["continue"]!,
        message: _translation["succes"]!,
      );
    } else if (signInResult == LoginStatus.NOT_FOUND) {
      toggleIsLoading();

      showPopup(
        context: context,
        type: 'error',
        message: _translation["no_existing_acc"]!,
        buttonText: _translation["continue"]!,
        onPressed: () => Navigator.pop(context),
      );
    } else if (signInResult == LoginStatus.WRONG_DETAILS) {
      toggleIsLoading();

      showPopup(
        context: context,
        type: 'error',
        message: _translation["failed_login"]!,
        buttonText: _translation["continue"]!,
        onPressed: () => Navigator.pop(context),
      );
    } else {
      toggleIsLoading();

      showPopup(
        context: context,
        type: 'error',
        message: _translation["error"]!,
        buttonText: _translation["continue"]!,
        onPressed: () => Navigator.pop(context),
      );
    }
  }
}
