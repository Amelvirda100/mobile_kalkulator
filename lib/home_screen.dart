import 'package:flutter/material.dart';
import 'components/login_form.dart';
import 'components/header_image.dart';

import 'pilihan_menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      // Jika ada field yang kosong, tampilkan notifikasi warna biru/ungu
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Mohon lengkapi data Anda!"),
          backgroundColor: const Color(0xFF5C6BC0), // Warna biru keunguan
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
        ),
      );
    } else if (username == "admin" && password == "1234") {
      // Jika login berhasil, pindah ke halaman berikutnya
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PilihanMenu()),
      );
    } else {
      // Jika username atau password salah, tampilkan notifikasi merah
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Username atau password salah!"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB8C4ED),
      body: Stack(
        children: [
          // Gambar tetap di posisi absolut, tidak naik saat keyboard muncul
          Positioned(
            top: 100, // Sesuaikan posisi gambar
            left: 0,
            right: 0,
            child: const HeaderImage(),
          ),

          Positioned(
            top: 50, // Sesuaikan posisi teks
            left: 16,
            right: 75,
            child: const Text(
              'Hi! Who are you?',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inria Sans',
              ),
            ),
          ),

          // Isi utama tetap dalam scrollable layout agar bisa discroll
          Positioned(
            left: 0,
            right: 0,
            bottom: 0, // Awalnya di paling bawah
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom > 0
                    ? MediaQuery.of(context).viewInsets.bottom +
                        1 // Naik saat keyboard muncul
                    : 0, // Saat keyboard tidak muncul, tetap di paling bawah
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // Supaya sesuai dengan kontennya
                  children: [
                    LoginForm(
                      usernameController: usernameController,
                      passwordController: passwordController,
                      onLogin: login,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
