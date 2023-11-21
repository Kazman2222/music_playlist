import 'package:audio_playlist/adminPanel/admin_panel.dart';
import 'package:audio_playlist/home/final_home.dart';
import 'package:audio_playlist/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:audio_playlist/home/playlist.dart';
import 'package:audio_playlist/home/radio.dart';

import 'package:audio_playlist/login/login.dart';
import 'package:audio_playlist/login/logout.dart';
import 'package:audio_playlist/popUps/utils.dart';
import 'package:audio_playlist/routes/routes.dart';
import 'package:audio_playlist/state_management/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'components/buttons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //       apiKey: 'AIzaSyC0ob_u3dQjlZNSj4eMATIXvtKOk6DT34k',
  //       appId: "XXX",
  //       messagingSenderId: "XXX",
  //       projectId: "playlistfy-1639e",
  //       storageBucket: "real-project-8a997.appspot.com"),
  // );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, _) {
          // return ChangeNotifierProvider(
          //   create: ((context) => AudioManagement()),
          //   builder: ((context, child) {
          //     return MaterialApp(
          //       scaffoldMessengerKey: messengerKey,
          //       navigatorKey: navigatorKey,
          //       initialRoute: determineInitialRoute(),
          //       onGenerateRoute: routeManager.routeSettings,
          //       debugShowCheckedModeBanner: false,
          //       title: 'Flutter Demo',
          //       theme: ThemeData(
          //         // This is the theme of your application.
          //         //
          //         // Try running your application with "flutter run". You'll see the
          //         // application has a blue toolbar. Then, without quitting the app, try
          //         // changing the primarySwatch below to Colors.green and then invoke
          //         // "hot reload" (press "r" in the console where you ran "flutter run",
          //         // or simply save your changes to "hot reload" in a Flutter IDE).
          //         // Notice that the counter didn't reset back to zero; the application
          //         // is not restarted.
          //         primarySwatch: Colors.blue,
          //         fontFamily: 'Inter',
          //       ),
          //       builder: (context, child) {
          //         return ScrollConfiguration(
          //             behavior: AppBehavior(), child: child!);
          //       },
          //     );
          //   }),
          // );
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AudioManagement>(
                  create: (context) => AudioManagement()),
              ChangeNotifierProvider<Toggler>(create: (context) => Toggler()),
            ],
            builder: ((context, child) {
              return MaterialApp(
                scaffoldMessengerKey: messengerKey,
                navigatorKey: navigatorKey,
                initialRoute: determineInitialRoute(),
                onGenerateRoute: routeManager.routeSettings,
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  // This is the theme of your application.
                  //
                  // Try running your application with "flutter run". You'll see the
                  // application has a blue toolbar. Then, without quitting the app, try
                  // changing the primarySwatch below to Colors.green and then invoke
                  // "hot reload" (press "r" in the console where you ran "flutter run",
                  // or simply save your changes to "hot reload" in a Flutter IDE).
                  // Notice that the counter didn't reset back to zero; the application
                  // is not restarted.
                  primarySwatch: Colors.blue,
                  fontFamily: 'Inter',
                ),
                builder: (context, child) {
                  return ScrollConfiguration(
                      behavior: AppBehavior(), child: child!);
                },
              );
            }),
          );
        });
  }
}

class AppBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

String determineInitialRoute() {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return routeManager.homePages; // Navigate to home screen
  } else {
    return routeManager.onboarding1; // Navigate to login screen
  }
}
