
import 'package:flutter/material.dart';
import 'package:gragat/core/colors.dart';
import 'package:gragat/core/styles.dart';

class BasicProductWidget extends StatelessWidget {
  
  const BasicProductWidget({super.key, 
    required this.title,
    required this.imagePath,
    this.imageFillWidth =false,
    this.onTap,
  });

  final String title;
  final String imagePath;
  final VoidCallback? onTap;
  final bool imageFillWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: imageFillWidth? StackFit.passthrough:StackFit.expand,
          children: [
            // ✅ Image
            // ✅ Dark overlay (عشان النص يوضح)
            imageFillWidth?SizedBox(width: 300,child: imageWidget(),):imageWidget(),
            Container( 
              width:imageFillWidth? 300:0,
              decoration:setBoxDecoration(gradient: imageGradient
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
                style: setTextStyle(fontWight: FontWeight.w400,color: whiteColor,fontSize: 14,
                  height: 1.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageWidget ()=>
           Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                // ignore: deprecated_member_use
                color: grayColor,
                alignment: Alignment.center,
                child: Icon(Icons.image_not_supported, color: mainColor),
              ),
            );
      
}
