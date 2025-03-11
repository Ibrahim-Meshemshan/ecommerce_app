import 'package:flutter/material.dart';

import '../../../../../../core/Theme/theme_manager.dart';

class IncrementOrDecrementComponent extends StatelessWidget {
   IncrementOrDecrementComponent({super.key,required this.path, this.onTap});
  void Function()? onTap;
  String path;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ImageIcon(
         AssetImage(
            path),
        color: ThemeManager.whiteColor,
      ),
    );
  }
}
