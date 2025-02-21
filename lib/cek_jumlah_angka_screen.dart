import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cek Jumlah Angka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2D336B)),
        useMaterial3: true,
      ),
      home: const CheckNumberScreen(),
    );
  }
}

class CheckNumberScreen extends StatefulWidget {
  const CheckNumberScreen({super.key});

  @override
  _CheckNumberScreenState createState() => _CheckNumberScreenState();
}

class _CheckNumberScreenState extends State<CheckNumberScreen> {
  final TextEditingController _controller = TextEditingController();
  int _digitCount = 0;

  void _checkDigits() {
    if (_controller.text.isEmpty) {
      _showSnackBar('Input tidak boleh kosong!', Colors.red);
      return;
    }

    setState(() {
      _digitCount = RegExp(r'\d').allMatches(_controller.text).length;
    });
  }

  void _showSnackBar(String message, Color color) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: keyboardHeight > 0 ? keyboardHeight + 20 : 20,
          left: 16,
          right: 16,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFFCCD4EE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Ayo cek jumlah angka yang kamu input!!!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          'assets/cakar.png',
                          width: 320,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 300,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                const BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _controller,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: _checkDigits,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2D336B),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Cek',
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Jumlah angka: $_digitCount',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          // Animasi agar konten naik saat keyboard muncul
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? -100 : 20,
            // Jika keyboard muncul, geser keluar layar
            right: 20,
            child: Image.asset(
              'assets/daduangka.png',
              width: 80,
            ),
          ),
        ],
      ),
    );
  }
}
