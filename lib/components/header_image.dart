import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/beruangputih.png', // Ganti dengan path yang sesuai di folder assets
      width: double.infinity,
      fit: BoxFit.contain,
      alignment: Alignment.center,
    );
  }
}
