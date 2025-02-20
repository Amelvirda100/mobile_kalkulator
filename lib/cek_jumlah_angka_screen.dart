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
    setState(() {
      _digitCount = RegExp(r'\d').allMatches(_controller.text).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCD4EE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        size: 30, color: Colors.black),
                    onPressed: () {
                      // Aksi kembali, misalnya pop ke halaman sebelumnya
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Ayo cek jumlah angka yang kamu input!!!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 0.5, // 50% transparan
                    child: Image.asset(
                      'assets/cakar.png',
                      width: 320,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 400,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _controller,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 24),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 20),
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
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/daduangka.png',
                      width: 80,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
