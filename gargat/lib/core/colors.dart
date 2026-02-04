import 'package:flutter/material.dart';

Color mainColor = Color(0xff126678);
Color iconColor = Color(0xffFF6810);
Color subColor = Color(0xffFFA047);
Color blackColor =Colors.black;
Color lightBlueColor =Color(0XFF02A9B4);
Color whiteColor = Colors.white;
Color grayColor =Color(0xFFE6EDF3);
Color lightGray =Color(0xFF9D9D9D);
LinearGradient linearGradient =LinearGradient(colors: [iconColor,subColor]);
LinearGradient imageGradient =LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.05),
                    mainColor
                  ]);