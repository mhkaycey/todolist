import 'package:get/get.dart';
import 'package:mytodo/constants/services/provider.dart';
import 'package:mytodo/constants/services/repository.dart';

import 'index.dart';

class DashBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(
      () => DashBoardController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}
