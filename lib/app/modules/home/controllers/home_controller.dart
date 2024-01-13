import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference products = firestore.collection("Product");
    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("Product");
    return products.orderBy("date", descending: true).snapshots();
    // return products.where("price", isGreaterThanOrEqualTo: 1000).snapshots();
  }

  void delete(String docID) async {
    DocumentReference docRef = firestore.collection("Product").doc(docID);
    try {
      Get.defaultDialog(
          title: "Hapus Data",
          middleText: "Apakah anda yakin",
          onConfirm: () async {
            await docRef.delete();
            Get.back();
          },
          textConfirm: "Yes",
          textCancel: "No");
    } catch (e) {
      print(e);
      Get.defaultDialog(
          title: "Terjadi Kesalahan", middleText: "Data gagal dihapus");
    }
  }
}
