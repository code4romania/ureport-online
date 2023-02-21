import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/data/sp_utils.dart';
import 'package:ureport_ecaro/data/translation.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/utils/enums.dart';
import 'package:ureport_ecaro/view/screens/account/login-register/login_register_widgets.dart';
import 'package:ureport_ecaro/view/shared/general_button_component.dart';
import 'package:ureport_ecaro/view/shared/top_header_widget.dart';
import 'package:ureport_ecaro/view_model/state_store.dart';
import 'package:validators/validators.dart' as validator;

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
                child: CircularProgressIndicator(),
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
                    color: Colors.blue,
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

    if (!validator.isEmail(_emailController.text)) {
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
        type: 'register',
        onPressed: () {
          //TODO: GET TOKEN FROM REMOTE AND SET TO STORAGE
          SPUtil().setValue("token", "############");

          context.router.replace(ArticlesCategoryScreenRoute(
            categoryImg: "https://i.ytimg.com/vi/2QvOxa_7wEw/maxresdefault.jpg",
            categoryTitle: "Test",
            key: Key("test"),
          ));
        },
      );
    } else if (registerResult == RegisterStatus.EMAIL_EXISTS) {
      toggleIsLoading();
      showPopup(
          context: context,
          message: _translation["existing_acc"],
          type: 'error',
          onPressed: () {
            Navigator.pop(context);
          });
    } else {
      toggleIsLoading();
      showPopup(
          context: context,
          message: _translation["error"],
          type: 'error',
          onPressed: () {
            Navigator.pop(context);
          });
    }
  }
}
