import 'package:flutter/material.dart';

import '../../../../../../core/Theme/theme_manager.dart';

class RowWidget extends StatelessWidget {
  RowWidget({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: ThemeManager.appTheme.textTheme.titleMedium
                ?.copyWith(color: ThemeManager.primaryColor)),
        TextButton(
          onPressed: () {},
          child: Text(
            'View all',
            style: TextStyle(color: ThemeManager.primaryColor),
          ),
        ),
      ],
    );
  }
}
