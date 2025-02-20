import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cek_angka_screen.dart';
import 'home_screen.dart';
import 'menu_data_anggota.dart';
import 'kalkulator_screen.dart';
import 'cek_jumlah_angka_screen.dart';

class PilihanMenu extends StatelessWidget {
  const PilihanMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 480),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.fromLTRB(56, 72, 56, 116),
              decoration: const BoxDecoration(
                color: Color(0xFFCCD4EE),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/beruangitamputih.png',
                      width: 108,
                      height: 108,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 32),
                  MenuItem(
                    iconUrl:
                        'assets/operasibilangan.png', // Mengambil gambar dari assets lokal
                    title: 'Operasi Bilangan',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KalkulatorScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  MenuItem(
                    iconUrl: 'assets/ganjilgenap.png',
                    title: 'Ganjil/Genap?',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CekAngkaScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 36),
                  MenuItem(
                    iconUrl: 'assets/cekjumlah.png',
                    title: 'Cek Jumlah Angka',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckNumberScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 36),
                  MenuItem(
                    iconUrl: 'assets/dataanggota.png',
                    title: 'Data Anggota',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MenuDataAnggota()),
                      );
                    },
                  ),
                  const SizedBox(height: 36),
                  MenuItem(
                    iconUrl: 'assets/logout.png',
                    title: 'Log Out',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
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

class MenuItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;

  const MenuItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF2F2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image.network(
              iconUrl,
              width: 41,
              height: 41,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 22),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Itim',
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
