import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/constants/model/task.dart';
import 'package:mytodo/screen/dashboard/controller.dart';
import 'package:mytodo/screen/details/details.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Tile extends StatelessWidget {
  final controller = Get.find<DashBoardController>();
  final Task task;

  Tile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    var total = controller.doingTodos.length + controller.doingTodos.length;
    var current = controller.doneTodos.length;

    var precent = (current / total * 100).toStringAsFixed(0);

    return GestureDetector(
      onTap: () {
        controller.changeTask(task);
        controller.changeTodos(task.todos ?? []);
        Get.to(() => Details());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: controller.getBGClr(task.color ?? 0),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                IconData(task.icon,
                                    fontFamily: 'MaterialIcons'),
                                color: controller.getBGClr(task.color ?? 0),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 7),
                      Text(
                        task.title.toString(),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${task.todos?.length ?? 0} TASKS',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 20),
            StepProgressIndicator(
              totalSteps: controller.isTodoEmpty(task) ? 1 : task.todos!.length,
              currentStep: controller.isTodoEmpty(task)
                  ? 0
                  : controller.getDoneTodo(task),
              size: 5,
              padding: 0,
              selectedGradientColor: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.grey,
                ],
              ),
              unselectedGradientColor: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white],
              ),
            ),

            UnconstrainedBox(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularStepProgressIndicator(
                  stepSize: 5,
                  selectedColor: controller.getBGClr(task.color ?? 0),
                  unselectedColor: Colors.black,
                  padding: 0,
                  width: 150,
                  height: 150,
                  selectedStepSize: 5,
                  roundedCap: (_, __) => true,
                  totalSteps:
                      controller.isTodoEmpty(task) ? 1 : task.todos!.length,
                  currentStep: controller.isTodoEmpty(task)
                      ? 0
                      : controller.getDoneTodo(task),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${total == 0 ? 0 : precent}%'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
