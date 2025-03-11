import 'package:flutter/material.dart';

import '../../../../../core/Theme/theme_manager.dart';

class FormName extends StatelessWidget {
   FormName({required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: ThemeManager.appTheme.textTheme.titleMedium!
          .copyWith(fontSize: 18),
    );
  }
}
