import 'package:flutter/material.dart';

class CircularImageBuilder extends StatelessWidget {
  final imageUrl;
  const CircularImageBuilder({Key? key, @required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage(
        imageUrl,
      ),
    );
  }
}
