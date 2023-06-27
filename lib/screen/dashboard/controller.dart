import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  DashBoardController();
  final navIndex = 0.obs;
  final formKey = GlobalKey<FormState>();
  final editCtrl = TextEditingController();
  final chipIndex = 0.obs;
  final selectedColor = 0.obs;

  void selectNavIndex(int index) {
    navIndex.value = index;
  }
}
