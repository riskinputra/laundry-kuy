import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

import 'app/widgets/splash.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      title: "Laundy Kuy",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpashScreen();
          } else {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: 'Poppins'),
              title: "Laundy Kuy",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
            );
          }
        });
  }
}
