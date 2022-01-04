import 'package:flutter/material.dart';

class ImageBuilder extends StatelessWidget {
  final String assetName;

  const ImageBuilder({Key? key, required this.assetName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      fit: BoxFit.contain,
      height: 150,
      width: 150,
    );
  }
}
