import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("Product").doc(docID);
    return docRef.get();
  }

  void edit(String name, int price, String docID) async {
    DocumentReference products = firestore.collection("Product").doc(docID);

    try {
      await products.update({
        "name": name,
        "price": price,
      });

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
