import 'package:flutter/material.dart';

class CekAngkaScreen extends StatefulWidget {
  @override
  _CekAngkaScreenState createState() => _CekAngkaScreenState();
}

class _CekAngkaScreenState extends State<CekAngkaScreen> {
  final TextEditingController _controller = TextEditingController();
  String _hasil = "";

  void _cekAngka() {
    if (_controller.text.isNotEmpty) {
      int? angka = int.tryParse(_controller.text);
      if (angka != null) {
        setState(() {
          _hasil = "$angka adalah angka ${angka % 2 == 0 ? "genap" : "ganjil"}";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD1D5EE),
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
      body: Padding(
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
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/beruangbingung.png',
                width: 210,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
