import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/screen/dashboard/controller.dart';
import 'package:mytodo/screen/home/controller.dart';
import 'package:mytodo/screen/home/widget/tile.dart';

class HomePage extends GetView<HomeController> {
  final dashController = Get.find<DashBoardController>();
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey, Kelechi",
                        style: TextStyle(fontSize: 28),
                      ),
                      Text("Welcome Back"),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                ...dashController.tasks.map((element) => Tile(task: element))
              ],
            )
            // GridView.builder(
            //   itemCount: 4,
            //   // crossAxisCount: 2,
            //   shrinkWrap: true,
            //   physics: const ClampingScrollPhysics(),
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //   ),
            //   itemBuilder: (BuildContext context, int index) {
            //     return Tile(
            //       index: index,
            //       backgroundColor: Colors.black12, task: null,
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
