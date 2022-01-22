import 'package:flutter/material.dart';

class ImageBuilder extends StatelessWidget {
  final String assetName;
  final BoxFit fit;
  final double height;
  final double width;

  const ImageBuilder(
      {Key? key,
      this.fit = BoxFit.contain,
      this.height = 150,
      this.width = 150,
      required this.assetName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      fit: BoxFit.contain,
      height: height,
      width: width,
    );
  }
}
