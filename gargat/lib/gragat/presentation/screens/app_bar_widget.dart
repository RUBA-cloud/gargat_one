
import 'package:gragat/core/contsant.dart';
import 'package:gragat/core/shared_packages.dart'; // فيه setBoxDecoration غالبًا
import 'package:gragat/gragat/presentation/widgets/icons_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      bottom: false,
      child: Container(
        color: whiteColor,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
        child: Row(
          children: [
            // Left: Delivering to + dropdown
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Delivering to:",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: mainColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Current Location",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: mainColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: mainColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Right icons
            IconButtonWidget(
              svgAsset: "$assetsImage/gift.svg", icon: null, onTap: () {  },
              
            ),
            SizedBox(width: 5,),
              // Right icons
            IconButtonWidget(
              svgAsset: "$assetsImage/heart.svg", icon: null, onTap: () {  },
              
            ),
           
            const SizedBox(width: 10),
            

            
          ],
        ),
      ),
    );
  }
}

