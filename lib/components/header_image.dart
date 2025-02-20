import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://cdn.builder.io/api/v1/image/assets%2Fa65bc4c53df446a5a78bf6263ebdce6f%2Fe825297bd14212c251ec31ae312bcc8af970ca4c2178e13c3c4a43a10f15ebc1',
      width: double.infinity,
      fit: BoxFit.contain,
      alignment: Alignment.center,
    );
  }
}
