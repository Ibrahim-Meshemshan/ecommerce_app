import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/Theme/theme_manager.dart';

class CustomFormField extends StatelessWidget {
  String fieldName;
  String hintText;
  IconButton? icon;
  TextEditingController controller;
  String? Function(String?)? validator;
  bool isObscure = false;
  TextInputType keyboardType;

  CustomFormField(

      {required this.fieldName,
        required this.hintText,
        required this.keyboardType,
        this.icon,
        required  this.isObscure,
        required this.controller,
        required this.validator});



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.verticalSpace,
        Text(
          fieldName,
          style: ThemeManager.appTheme.textTheme.titleSmall?.copyWith(
              color: ThemeManager.whiteColor, fontWeight: FontWeight.w500),
        ),
        20.verticalSpace,
        TextFormField(
          cursorColor: Colors.black,
          keyboardType: keyboardType,
          obscureText: isObscure,
          validator: validator,
          controller: controller,
          style: ThemeManager.appTheme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold
          ),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: ThemeManager.appTheme.textTheme.titleSmall,
              filled: true,
              fillColor: ThemeManager.whiteColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: ThemeManager.whiteColor),
              ),
              suffixIcon: icon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              )),
        ),
      ],
    );
  }
}
