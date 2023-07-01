import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/screen/dashboard/controller.dart';

class DoingList extends StatelessWidget {
  final homeCtrl = Get.find<DashBoardController>();

  DoingList({super.key});

  @override
  Widget build(BuildContext context) {
    // final Task task;
    return Obx(
      () {
        return homeCtrl.doingTodos.isEmpty && homeCtrl.doneTodos.isEmpty
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text("No Todo List"),
                  // Image.asset(
                  //   'assets/images/task.jpg',
                  //   fit: BoxFit.cover,
                  //   width: 65.0,
                  // ),
                  Text(
                    "Add Task",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              )
            : ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  ...homeCtrl.doingTodos
                      .map(
                        (element) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 3.0,
                            horizontal: 9.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) => Colors.grey),
                                  onChanged: (bool? value) {
                                    homeCtrl.doneTodo(element['title']);
                                  },
                                  value: element['done'],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  element['title'],
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // final updateCtrl = TextEditingController(
                                  //   text: element['title'],
                                  // );
                                  // homeCtrl.deleteDoneTodo(element);
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (context) {
                                  //     return AlertDialog(
                                  //       title: const Text('Edit Task'),
                                  //       content: TextField(
                                  //         controller: updateCtrl,
                                  //         decoration: const InputDecoration(
                                  //             hintText: 'Enter task',
                                  //             labelText: 'Task'),
                                  //       ),
                                  //       actions: [
                                  //         TextButton(
                                  //           onPressed: () {
                                  //             Navigator.pop(context);
                                  //           },
                                  //           child: const Text('Cancel'),
                                  //         ),
                                  //         TextButton(
                                  //           onPressed: () {
                                  //             // homeCtrl.editTodos(
                                  //             //     element['title'],
                                  //             //     updateCtrl.text);
                                  //             Navigator.pop(context);
                                  //           },
                                  //           child: const Text('Save'),
                                  //         ),
                                  //       ],
                                  //     );
                                  //   },
                                  // );
                                  final updateCtrl = TextEditingController(
                                      text: element['title']);
                                  Get.defaultDialog(
                                    content: TextFormField(
                                      controller: updateCtrl,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            if (homeCtrl.formKey.currentState!
                                                .validate()) {
                                              updateCtrl.clear();
                                            }
                                          },
                                          icon: const Icon(Icons.done),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Please';
                                        }
                                        return null;
                                      },
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  if (homeCtrl.doingTodos.isNotEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 2),
                    ),
                ],
              );
      },
    );
  }
}
