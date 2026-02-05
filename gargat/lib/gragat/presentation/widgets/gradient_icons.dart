import 'package:gragat/core/shared_packages.dart';
import 'package:svg_image/svg_image.dart';


class GradientIcon extends StatelessWidget {
  const GradientIcon({
    super.key,
    required this.icon,
    required this.gradient,
    this.size = 26.0,
    this.semanticLabel,
    this.svgImage
  });

  final IconData? icon;
  final Gradient gradient;
  final double size;
  final String? semanticLabel;
    final String? svgImage;


  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      blendMode: BlendMode.srcIn,
      child:svgImage!=null?SvgImage(svgImage!, type: PathType.assets) : Icon(
        icon,
        size: size,
        color: whiteColor,
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
  String? svgImage,
}) {
  return GradientIcon(
    icon: icon,
    gradient: gradient,
    size: size,
    semanticLabel: semanticLabel,
  );
}
