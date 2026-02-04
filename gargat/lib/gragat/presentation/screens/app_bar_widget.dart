import 'package:flutter/material.dart';
import 'package:gragat/core/colors.dart';
import 'package:gragat/gragat/presentation/widgets/gradient_icons.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      bottom: false,
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Padding(
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
                    Row(
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
                        Icon(Icons.keyboard_arrow_down_rounded,
                            color: mainColor, size: 20),
                      ],
                    ),
                  ],
                ),
              ),
        
              // Right: icons
              iconButtonWidget(
                icon: Icons.shopping_bag_outlined,
                onTap: () {},
              ),
              const SizedBox(width: 10),
              iconButtonWidget(
                icon: Icons.favorite_border,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  Widget iconButtonWidget({required IconData icon, required VoidCallback onTap})=>


     InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color:whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: GradientIcon(icon: icon, gradient: linearGradient, size: 22),
      ),
    );


