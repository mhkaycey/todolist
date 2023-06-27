import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/screen/home/controller.dart';
import 'package:mytodo/screen/home/widget/tile.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          GridView.builder(
            itemCount: 4,
            // crossAxisCount: 2,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Tile(
                index: index,
                backgroundColor: Colors.black12,
              );
            },
            // child: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: 100,
            //     width: 80,
            //     decoration: BoxDecoration(
            //         color: Colors.amber,
            //         borderRadius: BorderRadius.circular(25)),
            //   ),
            // ),
          )
          // MasonryGridView.count(
          //   shrinkWrap: true,
          //   crossAxisCount: 2,
          //   mainAxisSpacing: 4,
          //   crossAxisSpacing: 4,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       height: 60,
          //       width: 60,
          //       color: Colors.green,
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}
