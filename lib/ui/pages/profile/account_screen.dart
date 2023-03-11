import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/ui/pages/login-register/components/login_register_widgets.dart';
import 'package:ureport_ecaro/ui/pages/profile/components/popup_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/snackbar_controller.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
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
  String? localProfilePic;
  String? remoteprofilePic;

  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    _state = context.read<StateStore>();

    _translation =
        translations["${_state.selectedLanguage}"]!["account_screen"]!;

    super.initState();

    remoteprofilePic =
        "https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg";
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    margin: EdgeInsets.only(
                      top: 10,
                      bottom: 20,
                    ),
                    height: 150,
                    width: 150,
                    child: localProfilePic != null
                        ? Image.file(
                            File(localProfilePic!),
                            fit: BoxFit.cover,
                          )
                        : remoteprofilePic != null
                            ? Image.network(
                                remoteprofilePic!,
                                fit: BoxFit.cover,
                              )
                            : Container(),
                  ),
                  Container(
                    child: Text(
                      _translation["size"]!,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      try {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(
                                type: FileType.image,
                                allowMultiple: false,
                                allowCompression: true);

                        if (result != null) {
                          if (result.files.single.size > 6000000) {
                            SnackbarController(
                                    context: context,
                                    message:
                                        "File size should be less than 6MB")
                                .show();
                            return;
                          }

                          setState(() {
                            localProfilePic = result.files.single.path!;
                          });
                        } else {}
                      } on Exception catch (e) {
                        SnackbarController(context: context, message: "Error")
                            .show();
                      } catch (e) {
                        SnackbarController(context: context, message: "Error")
                            .show();
                      }
                    },
                    child: Container(
                      width: 170,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(children: [
                        Icon(Icons.upload),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          _translation["upload"]!,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                    ),
                  ),
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
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => PopupComponent(
                        _translation["delete_account_confirmation_title"]!,
                        Icons.warning,
                        Color.fromRGBO(254, 226, 226, 1),
                        Color.fromRGBO(220, 38, 38, 1),
                        _translation["delete_account_confirmation_body"]!,
                        _translation["delete_account_confirmation_button"]!,
                        () => context.router.pop(),
                        _translation["back"]!,
                        () => context.router.pop(),
                      ),
                    );
                  },
                  child: Container(
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
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                "assets/images/unicef_about.svg",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
