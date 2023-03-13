import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/controllers/change_password_store.dart';
import 'package:ureport_ecaro/ui/pages/login-register/components/login_register_widgets.dart';
import 'package:ureport_ecaro/ui/pages/profile/components/popup_component.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';
import 'package:ureport_ecaro/ui/shared/text_navigator_component.dart';
import '../../shared/top_header_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key, required this.translations})
      : super(key: key);
  final Map<String, String> translations;

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late ChangePasswordStore _changePasswordStore;

  @override
  void dispose() {
    _changePasswordStore.reset();
    _changePasswordStore.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _changePasswordStore = ChangePasswordStore(widget.translations);
    super.initState();

    reaction((p0) => _changePasswordStore.result != null, (p0) {
      showDialog(
          context: context,
          builder: (context) {
            if (_changePasswordStore.result == true) {
              return PopupComponent(
                widget.translations["password_changed"]!,
                Icons.check_circle_outline,
                Color.fromRGBO(209, 250, 229, 1),
                Color.fromRGBO(5, 150, 105, 1),
                "",
                widget.translations["continue_button"]!,
                () => context.router.pop(),
                null,
                null,
              );
            } else {
              return PopupComponent(
                widget.translations["password_changed_error"]!,
                Icons.block,
                Color.fromRGBO(254, 226, 226, 1),
                Color.fromRGBO(220, 38, 38, 1),
                "",
                widget.translations["continue_button"]!,
                () => context.router.pop(),
                null,
                null,
              );
            }
          }).then((value) {
        if (_changePasswordStore.result != null) {
          if (_changePasswordStore.result == true) context.router.pop();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeaderWidget(title: widget.translations["header"]!),
            TextNavigatorComponent(
              title: widget.translations["back"]!,
              rightEdge: false,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Text(
                widget.translations["title"]!,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(
                widget.translations["body"]!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Observer(builder: (context) {
              return textField(
                label: widget.translations["current_password"]!,
                controller: _changePasswordStore.currentPasswordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                errorText: _changePasswordStore.currentPasswordError,
              );
            }),
            SizedBox(
              height: 30,
            ),
            Observer(builder: (context) {
              return textField(
                label: widget.translations["new_password"]!,
                controller: _changePasswordStore.newPasswordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                errorText: _changePasswordStore.newPasswordError,
              );
            }),
            Observer(builder: (context) {
              return textField(
                label: widget.translations["confirm_password"]!,
                controller: _changePasswordStore.passwordConfirmationController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                errorText: _changePasswordStore.passwordConfirmationError,
              );
            }),
            MainAppButtonComponent(
              title: widget.translations["save"]!,
              onPressed: () async =>
                  await _changePasswordStore.changePassowrd(),
            ),
          ],
        ),
      ),
    );
  }
}
