import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/utils/screen_size/responsive_extension.dart';

class ImagePngBox extends StatelessWidget {
  final String assetPath;
  final double size;
  final Color color;
  const ImagePngBox({
    super.key,
    required this.assetPath,
    this.size = 24.0,
    this.color = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(assetPath),
      size: context.responsive.scaledIconSize(size),
      color: color,
    );
  }
}
