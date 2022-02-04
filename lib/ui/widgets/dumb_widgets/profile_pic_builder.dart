import 'package:flutter/material.dart';

import 'placeholder_image.dart';

class ProfilePicBuilder extends StatelessWidget {
  const ProfilePicBuilder({
    required this.url,
    this.height = 100,
    this.width = 100,
    Key? key,
  }) : super(key: key);
  final String url;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: PlaceholderImage(
          imageUrl: url,
          fit: BoxFit.cover,
          showGreyBackground: true,
          roundedCorners: true,
        ),
      ),
    );
  }
}
