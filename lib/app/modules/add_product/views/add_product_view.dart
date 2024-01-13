import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddProductView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.nameC,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.priceC,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Price"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                // Mengonversi nilai dari priceC.text ke tipe data int
                int price = int.parse(controller.priceC.text);

                // Menambahkan produk dengan nama dan harga (sekarang tipe data int)
                controller.add(controller.nameC.text, price);
              },
              child: Text("Add Product"),
            )
          ],
        ),
      ),
    );
  }
}
