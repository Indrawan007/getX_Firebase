import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_firebase/controller/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<authController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => authC.Logout(), icon: Icon(Icons.logout))
          ],
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Nama Product"),
              subtitle: Text("Harga"),
            );
          },
        ));
  }
}
