import 'package:get/get.dart';
import 'package:mytodo/screen/home/index.dart';

class HomepageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
