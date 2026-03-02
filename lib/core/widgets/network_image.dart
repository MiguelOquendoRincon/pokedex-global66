import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/widgets/skeleton_image.dart';

/// A widget that displays a thumbnail image for a recipe meal.
/// It handles loading and error states by showing a placeholder image or a skeleton loader.
class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.height = 100,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
  });

  /// The URL of the image to be displayed.
  final String imageUrl;

  /// The height of the image.
  final double height;

  /// The width of the image.
  final double width;

  /// The fit property determines how the image should be inscribed into the space allocated during layout.
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Image.asset(
        'assets/images/placeholder.png',
        height: 100,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const SkeletonImage(height: 100, width: double.infinity);
      },
    );
  }
}
