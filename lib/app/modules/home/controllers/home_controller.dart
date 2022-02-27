import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late PageController pageController;
  var currentIndex = 0.obs;
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
  }
}
