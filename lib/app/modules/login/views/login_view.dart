import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_firebase/app/routes/app_pages.dart';
import 'package:getx_firebase/controller/auth_controller.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<authController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
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
                  authC.Login(controller.emailC.text, controller.passC.text),
              child: Text("Login"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum Punya Akun?"),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.SIGNUP),
                  child: Text("DAFTAR SEKARANG!"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
