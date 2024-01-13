import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_firebase/app/routes/app_pages.dart';
import 'package:getx_firebase/controller/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<authController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => authC.Logout(), icon: Icon(Icons.logout))
        ],
      ),
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //   future: controller.getData(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       var allData = snapshot.data!.docs;
      //       return ListView.builder(
      //         itemCount: allData.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             title: Text(
      //                 "${(allData[index].data() as Map<String, dynamic>)["name"]}"),
      //             subtitle: Text(
      //                 "${(allData[index].data() as Map<String, dynamic>)["price"]}"),
      //           );
      //         },
      //       );
      //     }
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var allData = snapshot.data!.docs;
            return ListView.builder(
              itemCount: allData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.toNamed(Routes.EDIT_PRODUCT,
                        arguments: allData[index].id);
                  },
                  title: Text(
                      "${(allData[index].data() as Map<String, dynamic>)["name"]}"),
                  subtitle: Text(
                      "${(allData[index].data() as Map<String, dynamic>)["price"]}"),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: Icon(Icons.add),
      ),
    );
  }
}
