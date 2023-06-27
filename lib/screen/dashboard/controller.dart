import 'package:get/get.dart';

class DashBoardController extends GetxController {
  DashBoardController();
  final navIndex = 0.obs;

  void selectNavIndex(int index) {
    navIndex.value = index;
  }
}
