import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: KalkulatorScreen(),
  ));
}

class KalkulatorScreen extends StatefulWidget {
  @override
  _KalkulatorScreenState createState() => _KalkulatorScreenState();
}

class _KalkulatorScreenState extends State<KalkulatorScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _hasil = "";
  String _operator = "assets/plus.png"; // Gambar awal simbol

  void _hitung(bool isTambah) {
    int? angka1 = int.tryParse(_controller1.text);
    int? angka2 = int.tryParse(_controller2.text);

    if (angka1 != null && angka2 != null) {
      setState(() {
        _hasil = isTambah ? "${angka1 + angka2}" : "${angka1 - angka2}";
        _operator = isTambah ? "assets/plus.png" : "assets/minus.png";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD1D5EE),
      resizeToAvoidBottomInset:
          false, // Mencegah elemen bergeser saat keyboard muncul
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Menu kalkulator Penjumlahan dan Pengurangan",
            style: TextStyle(color: Colors.black)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ayo lakukan operasi bilangan !!!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  TextField(
                    controller: _controller1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 15),
                  Image.asset(_operator, width: 50),
                  SizedBox(height: 15),
                  TextField(
                    controller: _controller2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset("assets/plus_button.png"),
                        iconSize: 50,
                        onPressed: () => _hitung(true),
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        icon: Image.asset("assets/minus_button.png"),
                        iconSize: 50,
                        onPressed: () => _hitung(false),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    _hasil,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      height: 100), // Tambah ruang agar tidak ketutup gambar
                ],
              ),
            ),
          ),
          // Posisi absolut menggunakan Align
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 20, right: 20), // Jarak dari pojok kanan bawah
              child: Image.asset(
                'assets/calculator.png',
                width: 138,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
