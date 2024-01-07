import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_firebase/controller/auth_controller.dart';

import '../controllers/reset_controller.dart';

class ResetView extends GetView<ResetController> {
  final authC = Get.find<authController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResetView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.emailC,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => authC.Reset(controller.emailC.text),
              child: Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}
