import 'package:flutter/material.dart';

Color mainColor = Color(0xff126678);
Color iconColor = Color(0xffFF6810);
Color subColor = Color(0xffFFA047);
Color yellowColor =Color(0xffE1A325);
Color blackColor =Colors.black;
Color lightBlueColor =Color(0XFF02A9B4);
Color whiteColor = Colors.white;
Color grayColor =Color(0xFFE6EDF3);
Color hintColor =Color(0xFF6B6B6B);
Color lightGray =Color(0xFF9D9D9D);
Color darkGray =Color(0xFF6C6C89);
Color lightBlue =Color(0xFFEFF7F8);
Color borderColor =Color(0xffE0E6EC);
LinearGradient linearGradient =LinearGradient(colors: [iconColor,subColor]);
LinearGradient imageGradient =LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // ignore: deprecated_member_use
                    Colors.black.withOpacity(0.05),
                    mainColor
                  ]);