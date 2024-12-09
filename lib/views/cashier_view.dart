import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cashier_controller.dart';
import '../controllers/login_controller.dart';
import '../widgets/input_field.dart';
import '../widgets/sidebar.dart';
import '../models/product.dart';

class CashierView extends StatelessWidget {
  final CashierController cashierController = Get.put(CashierController());
  final LoginController loginController = Get.find<LoginController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kasir',
          style: TextStyle(
            fontFamily: 'Jakarta',
            fontWeight: FontWeight.bold,
            color: Colors.white, // Warna teks AppBar menjadi putih
          ),
        ),
        backgroundColor: Colors.green[400], // Warna hijau pastel untuk AppBar
        centerTitle: true,
      ),
      drawer: Sidebar(),
      backgroundColor: Colors.green[50], // Warna latar belakang halaman
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama Produk Input
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CustomInputField(
                label: 'Nama Produk',
                controller: nameController,
                keyboardType: TextInputType.text,
                enabled: !cashierController.transactionCompleted.value,
              ),
            ),

            // Harga Produk Input
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CustomInputField(
                label: 'Harga',
                controller: priceController,
                keyboardType: TextInputType.number,
                enabled: !cashierController.transactionCompleted.value,
              ),
            ),

            // Tambah Produk Button
            ElevatedButton.icon(
              onPressed: cashierController.transactionCompleted.value
                  ? null
                  : () {
                      if (nameController.text.isNotEmpty &&
                          priceController.text.isNotEmpty) {
                        final price = double.tryParse(priceController.text);
                        if (price == null || price <= 0) {
                          Get.snackbar(
                            'Input Error',
                            'Harga produk harus valid dan lebih besar dari 0.',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          return;
                        }
                        final product = Product(
                          id: '',
                          name: nameController.text,
                          price: price,
                        );
                        cashierController.addProduct(product);
                        nameController.clear();
                        priceController.clear();
                      } else {
                        Get.snackbar(
                          'Input Error',
                          'Nama dan harga produk harus diisi.',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
              icon: const Icon(Icons.add),
              label: const Text('Tambah Produk'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // Total Price Display
            Obx(
              () => Text(
                'Total Harga: Rp ${cashierController.totalPrice.value.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Jakarta',
                ),
              ),
            ),
            const Divider(),

            Expanded(
              child: Obx(
                () {
                  if (cashierController.transactionCompleted.value) {
                    return Center(
                      child: Text(
                        'Transaksi Selesai. Tidak ada produk yang ditampilkan.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontFamily: 'Jakarta',
                        ),
                      ),
                    );
                  } else if (cashierController.products.isEmpty) {
                    return Center(
                      child: Text(
                        'Belum ada produk ditambahkan.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontFamily: 'Jakarta',
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: cashierController.products.length,
                    itemBuilder: (context, index) {
                      final product = cashierController.products[index];
                      return ListTile(
                        leading: const Icon(Icons.shopping_bag),
                        title: Text(
                          product.name,
                          style: TextStyle(fontFamily: 'Jakarta'),
                        ),
                        subtitle: Text(
                          'Rp ${product.price.toStringAsFixed(2)}',
                          style: TextStyle(fontFamily: 'Jakarta'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const Divider(),

            // Complete Transaction Button
            ElevatedButton.icon(
              onPressed: cashierController.transactionCompleted.value
                  ? null
                  : () {
                      cashierController.completeTransaction();
                    },
              icon: const Icon(Icons.check),
              label: const Text('Selesaikan Transaksi'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[300],
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
