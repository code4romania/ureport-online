import 'package:flutter/material.dart';
import 'package:ureport_ecaro/ui/pages/login-register/components/login_register_widgets.dart';
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
  final currentPwController = TextEditingController();
  final newPwController = TextEditingController();
  final confirmNewPwController = TextEditingController();

  var _pwError;
  var _newPwError;
  var _confNewPwError;

  Future<void> changePassword() async {
    // User user = FirebaseAuth.instance.currentUser!;

    // await user
    //     .reauthenticateWithCredential(EmailAuthProvider.credential(
    //         email: user.email!, password: currentPwController.text))
    //     .then((value) {
    //   user.updatePassword(newPwController.text);
    //   Navigator.of(context).pop();
    // });
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
            textField(
              label: widget.translations["current_password"]!,
              controller: currentPwController,
              obscureText: false,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              errorText: _pwError,
            ),
            SizedBox(
              height: 30,
            ),
            textField(
              label: widget.translations["new_password"]!,
              controller: newPwController,
              obscureText: false,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              errorText: _newPwError,
            ),
            textField(
              label: widget.translations["confirm_password"]!,
              controller: confirmNewPwController,
              obscureText: false,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              errorText: _confNewPwError,
            ),
            MainAppButtonComponent(
              title: widget.translations["save"]!,
              onPressed: (() {
                setState(() {
                  if (currentPwController.text.isEmpty) {
                    _pwError = widget.translations["empty_password"]!;
                  } else {
                    _pwError = null;
                  }
                  if (newPwController.text.isEmpty) {
                    _newPwError = widget.translations["empty_password"]!;
                  } else {
                    _newPwError = null;
                  }
                  if (confirmNewPwController.text.isEmpty) {
                    _confNewPwError = widget.translations["empty_password"]!;
                  } else {
                    _confNewPwError = null;
                  }
                  if (newPwController.text != confirmNewPwController.text) {
                    _confNewPwError =
                        widget.translations["passwords_not_match"]!;
                  } else {
                    _confNewPwError = null;
                  }
                });
                changePassword();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
