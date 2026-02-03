
import 'package:flutter/material.dart';
import 'package:gragat/core/colors.dart';

class BasicProductWidget extends StatelessWidget {
  const BasicProductWidget({super.key, 
    required this.title,
    required this.imagePath,
    this.onTap,
  });

  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: SizedBox(height: 83,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // ✅ Image
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey.withOpacity(0.6),
                  alignment: Alignment.center,
                  child: Icon(Icons.image_not_supported, color: mainColor),
                ),
              ),
        
              // ✅ Dark overlay (عشان النص يوضح)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.05),
                      mainColor
                    ],
                  ),
                ),
              ),
        
              // ✅ Title bottom-left
              Positioned(
                left: 8,
                right: 8,
                bottom: 8,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
