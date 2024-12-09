import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.green[50], // Ubah background sidebar menjadi hijau pastel
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 25, 150, 90), // Warna header disesuaikan
              ),
              child: Center(
                child: Text(
                  'POS',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Jakartamedium',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard), // Icon untuk Dashboard
              title: const Text(
                'Dashboard',
                style: TextStyle(fontFamily: 'Jakarta'), // Font Jakarta
              ),
              onTap: () => Get.offNamed('/dashboard'),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart), // Icon untuk Kasir
              title: const Text(
                'Kasir',
                style: TextStyle(fontFamily: 'Jakarta'), // Font Jakarta
              ),
              onTap: () => Get.offNamed('/cashier'),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app), // Icon untuk Logout
              title: const Text(
                'Logout',
                style: TextStyle(fontFamily: 'Jakarta'), // Font Jakarta
              ),
              onTap: () => Get.offAllNamed('/login'),
            ),
          ],
        ),
      ),
    );
  }
}
