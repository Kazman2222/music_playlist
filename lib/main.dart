import 'package:audio_playlist/adminPanel/admin_panel.dart';
import 'package:audio_playlist/audiio_player.dart';
import 'package:audio_playlist/home/final_home.dart';
import 'package:audio_playlist/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:audio_playlist/home/playlist.dart';
import 'package:audio_playlist/home/radio.dart';
import 'package:audio_playlist/login/login.dart';
import 'package:audio_playlist/login/logout.dart';
import 'package:audio_playlist/routes/routes.dart';
import 'package:audio_playlist/state_management/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

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
          return ChangeNotifierProvider(
            create: ((context) => AudioManagement()),
            builder: ((context, child) {
              return MaterialApp(
                initialRoute: routeManager.radioPages,
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
