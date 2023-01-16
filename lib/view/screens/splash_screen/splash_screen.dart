import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/data/secure_storage.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/utils/click_sound.dart';
import 'package:ureport_ecaro/utils/resources.dart';
import 'package:ureport_ecaro/view_model/state_store.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StateStore _state;

  @override
  void initState() {
    super.initState();
    _state = context.read<StateStore>();
    setInitialLocal();
    initializeApp();
  }

  void setInitialLocal() {
    var localeLanguage = StorageUtil.getString("SELECTED_LANGUAGE");

    if (localeLanguage == "ro" ||
        localeLanguage == null ||
        localeLanguage.isEmpty) {
      _state.setLocale(Locale('ro'));
    } else if (localeLanguage == "ua") {
      _state.setLocale(Locale('ua'));
    }
  }

  Future<void> initializeApp() async {
    String? token = StorageUtil.getString("token");
    String? firstOpenApp = StorageUtil.getString("first_open_app");

    //check internet connection
    //check if it's first time on app
    //check if logged in

    checkInternetConnection();

    if (firstOpenApp == null || firstOpenApp.isEmpty) {
      context.router.replaceAll([OpenAppScreenRoute()]);
    } else {
      if (token == null || token.isEmpty) {
        context.router.replaceAll([LoginScreenRoute()]);
      } else {
        Timer(Duration(seconds: 3), () {
          context.router.replaceAll([ProfileScreenRoute()]);
        });
      }
    }
  }

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  void checkInternetConnection() async {
    bool isConnected = await checkConnection();

    if (!isConnected) {
      Timer.periodic(const Duration(seconds: 10), (timer) async {
        isConnected = await checkConnection();
        if (isConnected) {
          timer.cancel();
        }
      });
    }

    if (!isConnected) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            "No Internet Connection",
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            "Please check your internet connection and try again.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBgColor,
      body: Container(
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/v2_logo_1.png"),
              )),
        ),
      ),
    );
  }
}
