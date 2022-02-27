import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:laundry_kuy/app/modules/pelanggan/views/pelanggan_view.dart';
import 'package:laundry_kuy/app/modules/profile/views/profile_view.dart';
import 'package:laundry_kuy/app/modules/report/views/report_view.dart';
import 'package:laundry_kuy/app/widgets/hex_color.dart';
import '../controllers/home_controller.dart';
import '../../../widgets/bottom_navigation.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final BoxDecoration containerStyle = BoxDecoration(
        border: Border.all(color: HexColor('#DDDDDD')),
        borderRadius: BorderRadius.all(Radius.circular(8)));

    final List<Map<String, dynamic>> iconList = [
      {'name': 'Home', 'icon': Icons.home},
      {'name': 'Pelanggan', 'icon': Icons.people_alt_outlined},
      {'name': 'Report', 'icon': Icons.bar_chart},
      {'name': 'Profil', 'icon': Icons.person}
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 40,
          ),
          backgroundColor: HexColor('#274CD9')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar.builder(
            key: controller.bottomNavigationKey,
            height: Get.height / 12,
            itemCount: 4,
            tabBuilder: (index, isActive) {
              final color =
                  isActive ? HexColor('#274CD9') : HexColor('#616971');
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(iconList[index]['icon'], color: color),
                  SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      iconList[index]['name'],
                      style: TextStyle(color: color, fontSize: 10),
                    ),
                  )
                ],
              );
            },
            activeIndex: controller.currentIndex.value,
            gapLocation: GapLocation.center,
            backgroundColor: Colors.white,
            splashColor: HexColor('#274CD9'),
            splashSpeedInMilliseconds: 300,
            onTap: (position) {
              controller.currentIndex.value = position;
            },
          )),
      body: SafeArea(
        child: Obx(() => IndexedStack(
              index: controller.currentIndex.value,
              children: [
                HomePageView(containerStyle: containerStyle),
                PelangganView(),
                ReportView(),
                ProfileView()
              ],
            )),
      ),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({
    Key? key,
    required this.containerStyle,
  }) : super(key: key);

  final BoxDecoration containerStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Input Field,
          SizedBox(
            height: 12,
          ),
          Container(
            width: Get.width,
            padding: EdgeInsets.all(20),
            decoration: containerStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bunglondry - Cipete',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 13,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Buka Laundry'),
                  style: ElevatedButton.styleFrom(
                      primary: HexColor('#0D6EFD'),
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      fixedSize: Size(138, 42)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ContainerActivity(
              containerStyle: containerStyle,
              title: 'Semua Transaksi',
              image: 'assets/icons/journal-arrow-down.png'),
          SizedBox(
            height: 10,
          ),
          ContainerActivity(
            containerStyle: containerStyle,
            title: 'Masuk Hari ini',
            isImage: false,
          ),
          SizedBox(
            height: 10,
          ),
          ContainerActivity(
              containerStyle: containerStyle,
              title: 'Diambil Hari ini',
              image: 'assets/icons/journal-arrow-up.png'),
        ],
      ),
    );
  }
}

class ContainerActivity extends StatelessWidget {
  const ContainerActivity({
    Key? key,
    required this.containerStyle,
    required this.title,
    this.image = 'assets/icons/journal-arrow-down.png',
    this.isImage = true,
  }) : super(key: key);

  final BoxDecoration containerStyle;
  final String title;
  final String image;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: Get.width,
        padding: EdgeInsets.all(20),
        decoration: containerStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 140,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 24,
                    color: HexColor('#343A40'),
                    fontWeight: FontWeight.w700),
              ),
            ),
            isImage
                ? Image.asset(image)
                : Container(
                    width: 67,
                    height: 67,
                    decoration: BoxDecoration(
                        border: Border.all(color: HexColor('#7B838A')),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: HexColor('#D927BD'),
                              border: Border.all(color: HexColor('#D927BD')),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8))),
                          child: Text(
                            'Okt',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text('22',
                            style: TextStyle(
                                color: HexColor('#484E53'),
                                fontSize: 28,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
