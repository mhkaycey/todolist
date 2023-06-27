import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateType extends StatelessWidget {
  const CreateType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: const EdgeInsets.symmetric(vertical: 10),
            radius: 5,
            title: "Create Type",
            content: const Form(
              child: Column(
                children: [],
              ),
            ),
          );
        },
      ),
    );
  }
}
