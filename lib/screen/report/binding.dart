import 'package:get/get.dart';
import 'package:mytodo/screen/report/index.dart';

class ReportBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportController>(
      () => ReportController(),
    );
  }
}
