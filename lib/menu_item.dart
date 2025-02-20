import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String icon;
  final String title;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 1)
        ],
      ),
      child: Row(
        children: [
          Image.network(icon, width: 40, height: 40),
          const SizedBox(width: 20),
          Text(title, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
