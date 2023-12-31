import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/screen/dashboard/controller.dart';

class DoneList extends StatelessWidget {
  final homeCtrl = Get.find<DashBoardController>();

  DoneList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final task = homeCtrl.task.value;
      return homeCtrl.doneTodos.isNotEmpty
          ? ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     vertical: 2.0,
                //     horizontal: 5.0,
                //   ),
                //   child: Text(
                //     "Completed(${homeCtrl.doneTodos.length})",
                //     style: const TextStyle(
                //       fontSize: 14.0,
                //       color: Colors.grey,
                //     ),
                //   ),
                // ),
                ...homeCtrl.doneTodos
                    .map((element) => Dismissible(
                          key: ObjectKey(element),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) =>
                              homeCtrl.deleteDoneTodo(element),
                          background: Container(
                            color: Colors.red.withOpacity(0.8),
                            alignment: Alignment.centerRight,
                            child: const Padding(
                              padding: EdgeInsets.only(right: 7.0),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 3.0,
                              horizontal: 9.0,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Icon(
                                      Icons.done,
                                      color:
                                          homeCtrl.getBGClr(task?.color ?? 0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            element['title'],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                // decoration:
                                                //     TextDecoration.lineThrough,
                                                ),
                                          ),
                                          const SizedBox(height: 2),
                                          const Text("Status: Completed")
                                        ],
                                      ),
                                      // const Padding(
                                      //   padding: EdgeInsets.all(8.0),
                                      //   child: RotatedBox(
                                      //     quarterTurns: 3,
                                      //     child: Text("Done"),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ],
            )
          : Container();
    });
  }
}
