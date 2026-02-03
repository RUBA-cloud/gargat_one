import 'package:flutter/material.dart';

/// A reusable widget that paints an [Icon] with a [Gradient].
///
/// Example:
/// ```dart
/// GradientIcon(
///   Icons.star,
///   size: 28,
///   gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
/// )
/// ```
class GradientIcon extends StatelessWidget {
  const GradientIcon({
    super.key,
    required this.icon,
    required this.gradient,
    this.size = 26.0,
    this.semanticLabel,
  });

  final IconData icon;
  final Gradient gradient;
  final double size;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    // Use ShaderMask to apply the gradient to the icon. The icon's color
    // should be opaque (white works well) so the shader colors are visible.
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      blendMode: BlendMode.srcIn,
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
        semanticLabel: semanticLabel,
      ),
    );
  }
}

/// Convenience helper that returns a widget; useful when you prefer a
/// function-style API instead of creating a `GradientIcon` instance.
Widget gradientIcon(
  IconData icon, {
  required Gradient gradient,
  double size = 26.0,
  String? semanticLabel,
}) {
  return GradientIcon(
    icon: icon,
    gradient: gradient,
    size: size,
    semanticLabel: semanticLabel,
  );
}
