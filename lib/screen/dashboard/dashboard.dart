import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mytodo/screen/home/homepage.dart';
import 'package:mytodo/screen/report/index.dart';
import 'index.dart';

class DashBoard extends GetView<DashBoardController> {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    //  bool? isNotched = false;
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.navIndex.value,
            children: const [
              HomePage(),
              ReportPage(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(210, 70, 19, 137),
          onPressed: () {},
          child: const Icon(
            Icons.add,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            shape: BoxShape.rectangle,
            color: Color.fromARGB(210, 70, 19, 137),
          ),
          child: Obx(
            () => BottomNavigationBar(
              backgroundColor: Colors.transparent,
              useLegacyColorScheme: false,
              // iconSize: 30,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              onTap: (int index) => controller.selectNavIndex(index),
              currentIndex: controller.navIndex.value,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home_filled,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Report',
                  icon: Icon(
                    Icons.data_usage,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
