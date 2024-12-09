import 'package:pemob_uas/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemob_uas/views/register_view.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green[50], // Mengubah latar belakang ke hijau pastel
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  const Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jakarta',
                    ),
                  ),

                  SizedBox(height: 32),

                  // Email TextField
                  TextField(
                    onChanged: (value) {
                      controller.email.value = value;
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(fontFamily: 'Jakarta'),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Password TextField
                  TextField(
                    onChanged: (value) {
                      controller.password.value = value;
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(fontFamily: 'Jakarta'),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green[400], // Tombol berwarna hijau pastel
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Masuk",
                      style: TextStyle(
                        fontFamily: 'Jakarta',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Navigate to Register Page
                  Text(
                    "Belum punya akun?",
                    style: TextStyle(fontFamily: 'Jakarta'),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => Register());
                    },
                    child: Text(
                      "Daftar Sekarang",
                      style: TextStyle(
                          fontFamily: 'Jakarta',
                          color: Colors
                              .green[800]), // Warna hijau untuk tombol Daftar
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
