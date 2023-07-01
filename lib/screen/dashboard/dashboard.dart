import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/core/color/color.dart';
import 'package:mytodo/core/icons/get_icons.dart';
import 'package:mytodo/data/model/task.dart';
import 'package:mytodo/screen/dashboard/controller.dart';
import 'package:mytodo/screen/home/homepage.dart';
import 'package:mytodo/screen/report/index.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final controller = Get.find<DashBoardController>();
  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    // final colors = getColors();
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // );
    //  bool? isNotched = false;
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.navIndex.value,
            children: [
              HomePage(),
              const ReportPage(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(210, 70, 19, 137),
          onPressed: () => Get.defaultDialog(
            titlePadding: const EdgeInsets.symmetric(vertical: 10),
            title: "Create Type",
            content: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextFormField(
                      controller: controller.editCtrl,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Create Task Type',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please fill the empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Wrap(
                      spacing: 0,
                      children: icons
                          .map(
                            (element) => Obx(
                              () {
                                final index = icons.indexOf(element);
                                return ChoiceChip(
                                  label: element,
                                  selectedColor:
                                      const Color.fromARGB(210, 70, 19, 137),
                                  backgroundColor: Colors.white,
                                  selected: controller.chipIndex.value == index,
                                  onSelected: (bool selected) {
                                    controller.chipIndex.value =
                                        selected ? index : 0;
                                  },
                                );
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  _colorPalette(),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        maximumSize: const Size(200, 40)),
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        int icon =
                            icons[controller.chipIndex.value].icon!.codePoint;
                        var task = Task(
                          title: controller.editCtrl.text,
                          icon: icon,
                          color: controller.selectedColor(),
                        );
                        Get.back();
                        controller.addTask(task);
                      }
                    },
                    child: const Text("Create"),
                  )
                ],
              ),
            ),
          ),
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

  _colorPalette() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text(
        //   "Color",
        //   style: TextStyle(
        //     fontSize: 16,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.grey,
        //   ),
        // ),
        Wrap(
          children: List<Widget>.generate(
            5,
            (int index) => GestureDetector(
              onTap: () {
                //  setState(() {
                controller.selectedColor.value = index;
                //  });
              },
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: index == 0
                        ? primaryClr
                        : index == 1
                            ? pinkClr
                            : index == 2
                                ? yellowClr
                                : index == 3
                                    ? lightBlue
                                    : moove,
                    child: controller.selectedColor.value == index
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 16,
                          )
                        : Container(),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
