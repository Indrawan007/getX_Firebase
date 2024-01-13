import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void add(String name, int price) async {
    CollectionReference products = firestore.collection("Product");

    try {
      String date = DateTime.now().toIso8601String();
      await products.add({"name": name, "price": price, "date": date});

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menambahakn product",
          onConfirm: () {
            nameC.clear();
            priceC.clear();
            Get.back();
            Get.back();
          },
          textConfirm: "Okay");
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal menambahakn product",
      );
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    priceC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    priceC.dispose();
    super.onClose();
  }
}
