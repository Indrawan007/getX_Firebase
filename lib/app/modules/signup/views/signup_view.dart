import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_firebase/controller/auth_controller.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<authController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUpView'),
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
            TextField(
              controller: controller.passC,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () =>
                  authC.Signup(controller.emailC.text, controller.passC.text),
              child: Text("Daftar"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah Punya Akun?"),
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text("Login!"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
