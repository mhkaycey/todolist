import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/constants/color/color.dart';
import 'package:mytodo/constants/model/task.dart';

import 'package:mytodo/constants/services/repository.dart';

class DashBoardController extends GetxController {
  TaskRepository taskRepository;
  DashBoardController({required this.taskRepository});
  final navIndex = 0.obs;
  final formKey = GlobalKey<FormState>();
  final editCtrl = TextEditingController();

  final chipIndex = 0.obs;
  final selectedColor = 0.obs;
  final task = Rx<Task?>(null);
  final doingTodos = <dynamic>[].obs;
  final doneTodos = <dynamic>[].obs;
  final tasks = <Task>[].obs;
  final deleting = false.obs;

  void selectNavIndex(int index) {
    navIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();

    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    editCtrl.dispose();
    super.onClose();
  }

  void changeChipIndex(int value) {
    chipIndex.value = value;
  }

  void changeDeleting(bool value) {
    deleting.value = value;
  }

  void changeTodos(List<dynamic> select) {
    doingTodos.clear();
    doneTodos.clear();
    for (int i = 0; i < select.length; i++) {
      var todo = select[i];
      var status = todo['done'];
      if (status == true) {
        doneTodos.add(todo);
      } else {
        doingTodos.add(todo);
      }
    }
  }

  bool addTask(Task task) {
    if (tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    return true;
  }

  void deleteTask(Task task) {
    tasks.remove(task);
  }

  void changeTask(Task? select) {
    task.value = select;
  }

  updateTask(Task task, String title) {
    List todos = task.todos ?? [];
    if (containsTodo(todos, title)) {
      return false;
    }
    var todo = {'title': title, 'done': false};
    todos.add(todo);
    var newTask = task.copyWith(todos: todos);
    int oldIdx = tasks.indexOf(task);
    tasks[oldIdx] = newTask;
    tasks.refresh();
    return true;
  }

  bool containsTodo(List todos, title) {
    return todos.any((element) => element['title'] == title);
  }

  bool addTodo(String title) {
    var todo = {'title': title, 'done': false};
    if (doingTodos
        .any((element) => mapEquals<String, dynamic>(todo, element))) {
      return false;
    }
    var doneTodo = {'title': title, 'done': true};
    if (doneTodos
        .any((element) => mapEquals<String, dynamic>(doneTodo, element))) {
      return false;
    }
    doingTodos.add(todo);
    return true;
  }

  void updateTodos() {
    var newTodos = <Map<String, dynamic>>[];
    newTodos.addAll([
      ...doingTodos,
      ...doneTodos,
    ]);
    var newTask = task.value!.copyWith(todos: newTodos);
    int oldIdx = tasks.indexOf(task.value);
    tasks[oldIdx] = newTask;
    tasks.refresh();
  }

  void doneTodo(String title) {
    var doingTodo = {'title': title, 'done': false};
    int index = doingTodos.indexWhere(
        (element) => mapEquals<String, dynamic>(doingTodo, element));
    doingTodos.removeAt(index);
    var doneTodo = {'title': title, 'done': true};
    doneTodos.add(doneTodo);
    doingTodos.refresh();
    doneTodos.refresh();
  }

  editTodos(dynamic index, dynamic editTodo) {
    var todos = doingTodos[index];
    // .indexWhere((element) => mapEquals<String, dynamic>(element, ));
    doingTodos[todos] = editTodo;
    // tasks[index] = editTodo;
    tasks.refresh();
  }

  void deleteDoneTodo(dynamic title) {
    int index = doneTodos
        .indexWhere((element) => mapEquals<String, dynamic>(title, element));
    doneTodos.removeAt(index);
    doneTodos.refresh();
  }

  bool isTodoEmpty(Task task) {
    return task.todos == null || task.todos!.isEmpty;
  }

  int getDoneTodo(Task task) {
    var res = 0;
    for (int i = 0; i < task.todos!.length; i++) {
      if (task.todos![i]['done']) {
        res += 1;
      }
    }
    return res;
  }

  int getTask(Task task) {
    var res = 0;
    for (int i = 0; i < task.todos!.length; i++) {
      if (task.todos![i]) {
        res += 1;
      }
    }
    return res;
  }

  int getTotalTask() {
    var result = 0;
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].todos != null) {
        result += tasks[i].todos!.length;
      }
    }
    return result;
  }

  int getTotalDoneTask() {
    var res = 0;
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].todos != null) {
        for (int j = 0; j < tasks[i].todos!.length; j++) {
          if (tasks[i].todos![j]['done'] == true) {
            res += 1;
          }
        }
      }
    }
    return res;
  }

  getBGClr(int no) {
    switch (no) {
      case 0:
        return bluishClr;
      case 1:
        return pinkClr;
      case 2:
        return yellowClr;
      case 3:
        return lightBlue;
      case 4:
        return moove;
      default:
        return bluishClr;
    }
  }
}
