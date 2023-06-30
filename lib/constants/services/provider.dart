import 'dart:convert';

import 'package:get/get.dart';
import 'package:mytodo/constants/model/task.dart';
import 'package:mytodo/constants/services/key.dart';
import 'package:mytodo/constants/services/services.dart';

class TaskProvider {
  StorageService storageService = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(storageService.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    storageService.write(taskKey, jsonEncode(tasks));
  }
}
