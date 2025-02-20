import 'package:flutter/material.dart';

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
