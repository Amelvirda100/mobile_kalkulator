import 'package:flutter/material.dart';
import 'menu_item.dart';
import 'home_screen.dart'; // Pastikan ini mengandung LoginPage()

class PilihanMenu extends StatelessWidget {
  const PilihanMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCD4EE),
      appBar: AppBar(
        title: const Text("Menu Utama"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            MenuItem(
              icon: 'https://placehold.co/50x50',
              title: 'Operasi Bilangan',
            ),
            const SizedBox(height: 20),
            MenuItem(
              icon: 'https://placehold.co/50x50',
              title: 'Ganjil/Genap?',
            ),
            const SizedBox(height: 20),
            MenuItem(
              icon: 'https://placehold.co/50x50',
              title: 'Cek Jumlah Angka',
            ),
            const SizedBox(height: 20),
            MenuItem(
              icon: 'https://placehold.co/50x50',
              title: 'Data Anggota',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
