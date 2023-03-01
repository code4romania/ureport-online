import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/ui/pages/login-register/components/login_register_widgets.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/constants.dart';
import 'package:ureport_ecaro/utils/translation.dart';
import '../../shared/general_button_component.dart';
import '../../shared/text_navigator_component.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    super.key,
  });

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late StateStore _state;
  late Map<String, String> _translation;

  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    _state = context.read<StateStore>();

    _translation =
        translations["${_state.selectedLanguage}"]!["account_screen"]!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopHeaderWidget(title: _translation["header"]!),
            TextNavigatorComponent(
              title: _translation["back"]!,
              onPressed: () => context.router.pop(),
              rightEdge: false,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Text(
                _translation["title"]!,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                _translation["body"]!,
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
              label: _translation["username"]!,
              controller: usernameController,
              obscureText: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: double.infinity,
                    child: Text(
                      _translation["profile_pic"]!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "avatar.png",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            decoration: BoxDecoration(
                              color: blueColor,
                            ),
                            child: Text(
                              _translation["upload"]!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: Text(
                      _translation["size"]!,
                    ),
                  )
                ],
              ),
            ),
            MainAppButtonComponent(
                title: _translation["save"]!, onPressed: () {}),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    _translation["change_password"]!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    _translation["change_password_body"]!,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () => context.router.push(
                    ChangePasswordScreenRoute(
                      translations: translations["${_state.selectedLanguage}"]![
                          "change_password_screen"]!,
                    ),
                  ),
                  child: Container(
                    width: 170,
                    height: 40,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(children: [
                      Icon(Icons.key),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        _translation["change_password_button"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    _translation["delete_account"]!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    _translation["delete_account_body"]!,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 170,
                  height: 40,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(children: [
                    Icon(Icons.delete_outline_sharp, color: Colors.red),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      _translation["delete_account_button"]!,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/unicef_about.png",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
