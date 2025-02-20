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
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == "admin" && password == "1234") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PilihanMenu()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username atau password salah!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB8C4ED),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 14, 75, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.network(
                    'https://cdn.builder.io/api/v1/image/assets/a65bc4c53df446a5a78bf6263ebdce6f/b25c9289f7272034302b3ee92007816807fe4e29c6ed3bff4076d737c14168ff?apiKey=a65bc4c53df446a5a78bf6263ebdce6f&',
                    width: 19,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 43),
                  const Text(
                    'Hi! Who are you?',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inria Sans',
                    ),
                  ),
                ],
              ),
            ),
            const HeaderImage(),
            LoginForm(
              usernameController: usernameController,
              passwordController: passwordController,
              onLogin: login,
            ),
          ],
        ),
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
