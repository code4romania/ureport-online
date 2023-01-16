import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:ureport_ecaro/data/secure_storage.dart';
import 'package:ureport_ecaro/l10n/l10n.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/view_model/state_store.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppRouter _appRouter;
  late StateStore _stateStore;

  @override
  void initState() {
    _stateStore = StateStore();
    _appRouter = AppRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider(create: (context) => _stateStore),
        ],
        builder: (context, child) {
          print(_stateStore.locale?.countryCode);
          return MaterialApp.router(
            title: "Ureport Ecaro",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.pink,
              fontFamily: "Montserrat",
              backgroundColor: Colors.white,
              splashColor: Color.fromRGBO(167, 45, 111, 1),
            ),
            supportedLocales: L10n.all,
            locale: _stateStore.locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        },
      );
}
