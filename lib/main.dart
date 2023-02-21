import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/locator/locator.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/utils/connectivity_controller.dart';
import 'package:ureport_ecaro/view/screens/chat/chat-controller.dart';
import 'package:ureport_ecaro/view/screens/opinion/opinion_controller.dart';
import 'package:ureport_ecaro/view_model/state_store.dart';
import 'package:ureport_ecaro/view_model/story_state.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

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

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await GetStorage.init();
  await setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ChatController(),
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (context) => ConnectivityController()),
              ChangeNotifierProvider(create: (context) => ChatController()),
              ChangeNotifierProvider(create: (context) => OpinionController()),
              Provider(
                create: (context) => _stateStore,
              ),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.pink,
                fontFamily: "Inter",
                backgroundColor: Colors.white,
                splashColor: Color.fromRGBO(167, 45, 111, 1),
              ),
              routerDelegate: _appRouter.delegate(),
              routeInformationParser: _appRouter.defaultRouteParser(),
            ),
          );
        },
        // providers: [
        //   Provider(
        //     create: (context) => _stateStore,
        //   ),
        //   ChangeNotifierProvider(create: (context) => ConnectivityController()),
        //   ChangeNotifierProvider(create: (context) => ChatController()),
        // ],
        // builder: (context, child) {
        //   return MaterialApp.router(
        //     debugShowCheckedModeBanner: false,
        //     theme: ThemeData(
        //       primarySwatch: Colors.pink,
        //       fontFamily: "Inter",
        //       backgroundColor: Colors.white,
        //       splashColor: Color.fromRGBO(167, 45, 111, 1),
        //     ),
        //     routerDelegate: _appRouter.delegate(),
        //     routeInformationParser: _appRouter.defaultRouteParser(),
        //   );
        // },
      );
}
