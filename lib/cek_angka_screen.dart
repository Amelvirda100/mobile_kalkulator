import 'package:flutter/material.dart';

class CekAngkaScreen extends StatefulWidget {
  @override
  _CekAngkaScreenState createState() => _CekAngkaScreenState();
}

class _CekAngkaScreenState extends State<CekAngkaScreen> {
  final TextEditingController _controller = TextEditingController();
  String _hasil = "";

  void _showSnackbar(String message, Color color) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: keyboardHeight > 0
              ? keyboardHeight + 16
              : 16, // Naik saat keyboard muncul
        ),
      ),
    );
  }

  void _cekAngka() {
    if (_controller.text.isEmpty) {
      _showSnackbar("Harap masukkan angka terlebih dahulu!", Colors.red);
      return;
    }

    double? angkaDesimal = double.tryParse(_controller.text);
    if (angkaDesimal == null) {
      _showSnackbar("Harap masukkan angka yang valid!", Colors.red);
      return;
    }

    if (angkaDesimal % 1 != 0) {
      _showSnackbar("Cek ganjil-genap hanya berlaku untuk bilangan bulat!",
          Color(0xFF272C6B));
      return;
    }

    int angka = angkaDesimal.toInt();
    setState(() {
      _hasil = "$angka adalah angka ${angka % 2 == 0 ? "genap" : "ganjil"}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD1D5EE),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
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
                  Text(
                    "Masukkan Angka",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: _cekAngka,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF272C6B),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Cek",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _hasil,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 20),
              child: Image.asset(
                'assets/beruangbingung.png',
                width: 210,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
