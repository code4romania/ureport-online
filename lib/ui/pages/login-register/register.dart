import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/ui/pages/login-register/components/login_register_widgets.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
import 'package:ureport_ecaro/utils/translation.dart';
import '../../../utils/enums.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwdController = TextEditingController();
  final _confirmPwController = TextEditingController();

  var _emailError;
  var _passwordError;
  var _confirmPwError;
  var _nameError;

  late StateStore _stateStore;
  late Map<String, String> _translation;

  bool _isLoading = false;

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _translation =
        translations["${_stateStore.selectedLanguage}"]!["register_screen"]!;
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
                Text(_translation["separator_text"]!),
                Container(
                    width: 100,
                    child: Divider(
                      color: Colors.black,
                    )),
              ],
            )),
        textField(
          label: _translation["username"]!,
          textInputAction: TextInputAction.next,
          obscureText: false,
          keyboardType: TextInputType.name,
          controller: _nameController,
          errorText: _nameError,
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
          textInputAction: TextInputAction.next,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          controller: _passwdController,
          errorText: _passwordError,
        ),
        textField(
          label: _translation["confirm_password"]!,
          textInputAction: TextInputAction.done,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          controller: _confirmPwController,
          errorText: _confirmPwError,
        ),
        _isLoading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: LoadingIndicatorComponent(),
              )
            : MainAppButtonComponent(
                title: _translation["submit"]!,
                onPressed: () async => await register()),
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
      ]),
    )));
  }

  void toggleIsLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> register() async {
    if (_nameController.text.isEmpty || _nameController.text.length < 3) {
      setState(() {
        _nameError = _translation["short_username"];
      });
      return;
    } else {
      setState(() {
        _nameError = null;
      });
    }

    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text);

    if (!emailValid) {
      setState(() {
        _emailError = _translation["invalid_email"];
      });
      return;
    } else {
      setState(() {
        _emailError = null;
      });
    }

    if (_passwdController.text.length < 6) {
      setState(() {
        _passwordError = _translation["short_pw"];
      });
      return;
    } else {
      setState(() {
        _passwordError = null;
      });
    }
    if (_passwdController.text != _confirmPwController.text) {
      setState(() {
        _confirmPwError = _translation["no_matching_pw"];
      });
      return;
    } else {
      setState(() {
        _confirmPwError = null;
      });
    }
    toggleIsLoading();

    final registerResult =
        RegisterStatus.SUCCESS; // await FirebaseApis().register(
    //   name: _nameController.text,
    //   email: _emailController.text,
    //   password: _passwdController.text,
    // );
    if (registerResult == RegisterStatus.SUCCESS) {
      toggleIsLoading();

      showPopup(
        context: context,
        onPressed: () {
          SPUtil().setValue(SPUtil.KEY_AUTH_TOKEN, "############");

          context.router.replace(RootPageRoute());
        },
        buttonText: _translation["continue"]!,
        message: _translation["succes"]!,
      );
    } else if (registerResult == RegisterStatus.EMAIL_EXISTS) {
      toggleIsLoading();
      showPopup(
        context: context,
        onPressed: () {
          Navigator.pop(context);
        },
        buttonText: _translation["continue"]!,
        message: _translation["existing_acc"]!,
      );
    } else {
      toggleIsLoading();
      showPopup(
        context: context,
        onPressed: () {
          Navigator.pop(context);
        },
        message: _translation["error"]!,
        buttonText: _translation["continue"]!,
      );
    }
  }
}
