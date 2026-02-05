import 'package:gragat/core/shared_packages.dart';
import 'package:svg_image/svg_image.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onTap;

  // لو بدك SVG بدل Icon:
  final String? svgAsset; // مثال: "assets/images/heart.svg"

  const IconButtonWidget({
    super.key,
    required this.icon,
    required this.onTap,
    this.svgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: setBoxDecoration(
          color: lightBlue,
          borderRadius: BorderRadius.circular(12),
          // لو عندك borderColor:
          // borderColor: grayColor,
        ),
        alignment: Alignment.center,
        child: svgAsset != null
            ? SvgImage(
              svgAsset!,
                width: 20,
                height: 20,
                 type: PathType.assets, // Change to PathType.asset for asset images

                // بعض النسخ تدعم color:
                // color: mainColor,
              )
            : GradientIcon(
              icon: icon,gradient: linearGradient,
               
                
              ),
      ),
    );
  }
}
