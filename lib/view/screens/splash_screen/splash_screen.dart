import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/data/secure_storage.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
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

  Future<void> checkInternetConnection() async {
    bool isConnected = await checkConnection();

    if (!isConnected) {
      Timer.periodic(const Duration(seconds: 10), (timer) async {
        isConnected = await checkConnection();
        if (isConnected) {
          timer.cancel();
          hasInternetConnection();
        }
      });
    } else {
      hasInternetConnection();
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

  void hasInternetConnection() {
    String? token = StorageUtil.getString("token");

    if (token == null || token.isEmpty) {
      context.router.replaceAll([OpenAppScreenRoute()]);
    } else {
      context.router.replaceAll([
        RootPageRoute(),
        // ArticlesCategoryScreenRoute(
        //   categoryImg: "https://i.ytimg.com/vi/2QvOxa_7wEw/maxresdefault.jpg",
        //   categoryTitle: "Test",
        //   key: Key("test"),
        // )
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkInternetConnection(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
