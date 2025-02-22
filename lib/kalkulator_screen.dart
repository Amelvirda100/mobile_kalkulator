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
  String _operator = "assets/maths.png"; // Gambar awal simbol

  void _hitung(String operasi) {
    // Hapus spasi dari input
    _controller1.text = _controller1.text.replaceAll(" ", "");
    _controller2.text = _controller2.text.replaceAll(" ", "");

    String input1 = _controller1.text;
    String input2 = _controller2.text;

    // Error handling jika hanya satu field yang terisi
    if ((input1.isEmpty && input2.isNotEmpty) ||
        (input2.isEmpty && input1.isNotEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Yuk lengkapi kedua kolom"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.purple,
        ),
      );
      return;
    }

    // Cek apakah input mengandung koma
    if (input1.contains(",") || input2.contains(",")) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Untuk bilangan koma gunakan titik"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color.fromARGB(255, 147, 196, 222),
        ),
      );
      return;
    }

    double? angka1 = double.tryParse(input1);
    double? angka2 = double.tryParse(input2);

    if (angka1 == null || angka2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ayo masukkan angkanya dulu!"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color.fromARGB(255, 222, 152, 147),
        ),
      );
      return;
    }

    setState(() {
      switch (operasi) {
        case "plus":
          _hasil = "${angka1 + angka2}";
          _operator = "assets/plus_button.png";
          break;
        case "minus":
          _hasil = "${angka1 - angka2}";
          _operator = "assets/minus_button.png";
          break;
        case "multiply":
          _hasil = "${angka1 * angka2}";
          _operator = "assets/kali.png";
          break;
        case "divide":
          if (angka2 == 0) {
            _hasil = "Tidak bisa dibagi 0!";
          } else {
            _hasil = "${(angka1 / angka2).toStringAsFixed(2)}";
          }
          _operator = "assets/bagi.png";
          break;
      }
    });
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            Text(
              "Ayo lakukan operasi bilangan !!!",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Itim'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 15),
            Image.asset(_operator, width: 50),
            SizedBox(height: 15),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset("assets/plus_button.png"),
                  iconSize: 40,
                  onPressed: () => _hitung("plus"),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Image.asset("assets/minus_button.png"),
                  iconSize: 40,
                  onPressed: () => _hitung("minus"),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Image.asset("assets/kali.png"),
                  iconSize: 40,
                  onPressed: () => _hitung("multiply"),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Image.asset("assets/bagi.png"),
                  iconSize: 40,
                  onPressed: () => _hitung("divide"),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: _hasil),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
