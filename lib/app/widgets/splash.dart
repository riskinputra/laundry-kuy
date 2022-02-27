import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpashScreen extends StatelessWidget {
  const SpashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        backgroundColor: Color(0xFF274CD9),
        body: Center(
          child: Container(
            width: Get.width * 0.5,
            height: Get.height * 0.5,
            child: Column(
              children: [
                Image.asset('assets/logo/logo-splash.png'),
                SizedBox(
                  height: 28,
                ),
                Image.asset('assets/logo/logo-text-splash.png'),
                SizedBox(
                  height: 28,
                ),
                Text(
                  'Managing laundry',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
