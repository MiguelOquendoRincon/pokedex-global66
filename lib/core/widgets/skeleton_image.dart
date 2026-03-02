import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A widget that displays a skeleton loading image with a shimmer effect.
/// It can be used to indicate that an image is loading or being fetched.
class SkeletonImage extends StatelessWidget {
  /// The height and width of the skeleton image.
  final double height;

  /// The width of the skeleton image.
  final double width;

  /// Optional border radius for the skeleton image.
  final BorderRadius? borderRadius;

  const SkeletonImage({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }
}
