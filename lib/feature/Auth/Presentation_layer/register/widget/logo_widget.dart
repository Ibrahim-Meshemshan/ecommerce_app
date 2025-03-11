import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 75.h, left: 97.w, right: 96.w,),
      child: Image.asset(
        'assets/images/route_logo.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
