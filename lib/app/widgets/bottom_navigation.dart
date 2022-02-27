import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    int currentTab = 0;

    return AnimatedBottomNavigationBar(
      height: Get.height / 12,
      activeColor: Color(0xFF274CD9),
      inactiveColor: Color(0xFF616971),
      activeIndex: currentTab,
      gapLocation: GapLocation.center,
      backgroundColor: Colors.white,
      icons: [
        Icons.home,
        Icons.people_alt_outlined,
        Icons.bar_chart,
        Icons.person
      ],
      onTap: (value) {
        setState(() {
          currentTab = value;
        });
      },
    );

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 60,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentTab = 0;
                  });
                },
                minWidth: 56,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: currentTab == 0
                          ? Color(0xFF274CD9)
                          : Color(0xFF616971),
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          fontSize: 10,
                          color: currentTab == 0
                              ? Color(0xFF274CD9)
                              : Color(0xFF616971)),
                    )
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentTab = 1;
                  });
                },
                minWidth: 56,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_alt_outlined,
                      color: currentTab == 1
                          ? Color(0xFF274CD9)
                          : Color(0xFF616971),
                    ),
                    Text('Pelanggan',
                        style: TextStyle(
                            fontSize: 10,
                            color: currentTab == 1
                                ? Color(0xFF274CD9)
                                : Color(0xFF616971)))
                  ],
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentTab = 2;
                  });
                },
                minWidth: 56,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bar_chart,
                      color: currentTab == 2
                          ? Color(0xFF274CD9)
                          : Color(0xFF616971),
                    ),
                    Text('Report',
                        style: TextStyle(
                            fontSize: 10,
                            color: currentTab == 2
                                ? Color(0xFF274CD9)
                                : Color(0xFF616971)))
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentTab = 3;
                  });
                },
                minWidth: 56,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: currentTab == 3
                          ? Color(0xFF274CD9)
                          : Color(0xFF616971),
                    ),
                    Text('Profil',
                        style: TextStyle(
                            fontSize: 10,
                            color: currentTab == 3
                                ? Color(0xFF274CD9)
                                : Color(0xFF616971)))
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
