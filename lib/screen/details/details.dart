import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mytodo/screen/dashboard/controller.dart';
import 'package:mytodo/screen/details/bottomdrag.dart';
import 'package:mytodo/screen/details/details_list.dart';
import 'package:mytodo/screen/details/done_list.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Details extends StatelessWidget {
  final controller = Get.find<DashBoardController>();
  Details({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    final task = controller.task.value;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                              controller.updateTodos();
                              controller.changeTask(null);
                              controller.editCtrl.clear();
                            },
                            icon: const Icon(Icons.arrow_back),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            size: 30,
                            IconData(
                              task!.icon,
                              fontFamily: 'MaterialIcons',
                            ),
                            color: controller.getBGClr(task.color ?? 0),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            task.title,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Obx(() {
                      var totalTodos = controller.doingTodos.length +
                          controller.doneTodos.length;
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          top: 3.0,
                          right: 16.0,
                        ),
                        child: Row(
                          children: [
                            Text(
                              '$totalTodos Tasks',
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: StepProgressIndicator(
                                totalSteps: totalTodos == 0 ? 1 : totalTodos,
                                currentStep: controller.doneTodos.length,
                                size: 5,
                                padding: 0,
                                selectedGradientColor: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      controller.getBGClr(task.color ?? 0),
                                      Colors.grey
                                    ]),
                                unselectedGradientColor: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.grey[300]!,
                                    Colors.grey[300]!
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 5.0,
                      ),
                      child: TextFormField(
                        controller: controller.editCtrl,
                        autofocus: true,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            // prefixIcon: Icon(
                            //   Icons.check_box_outline_blank,
                            //   color: Colors.grey.shade400,
                            // ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  var succsess = controller
                                      .addTodo(controller.editCtrl.text);
                                  if (succsess) {
                                    Get.snackbar("", "",
                                        titleText: const Text(
                                          "Success",
                                          style: TextStyle(
                                            color: Colors.green,
                                          ),
                                        ),
                                        messageText: const Text(
                                          "Todo item added successfully",
                                        ));
                                    // EasyLoading.showSuccess(
                                    //     "Todo item added successfully");
                                  } else {
                                    Get.snackbar("An Error Occured",
                                        "Item already exist");
                                    // EasyLoading.showError("Item already exist");
                                  }
                                  controller.editCtrl.clear();
                                }
                              },
                              icon: const Icon(Icons.done),
                            )),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your todo item';
                          }
                          return null;
                        },
                      ),
                    ),
                    DoingList(),
                    //DoneList(),
                  ],
                ),
              ),
              BottomDrag(
                child: [
                  Center(
                    child: Container(
                      height: 8,
                      width: 140,
                      decoration: BoxDecoration(
                          color: Colors.brown.shade50,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => Center(
                      child: Text(
                        "COMPLETED (${controller.doneTodos.length})",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  DoneList(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
