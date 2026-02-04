import 'package:flutter/material.dart';


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
