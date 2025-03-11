import 'package:flutter/material.dart';

import '../../../../../../core/Theme/theme_manager.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'What do you search for ?',
              hintStyle: const TextStyle(fontWeight: FontWeight.w300),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      color: ThemeManager.primaryColor, width: 2)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                BorderSide(color: ThemeManager.primaryColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: ThemeManager.primaryColor,
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Image(image: AssetImage('assets/icon/🦆 icon _shopping cart_.png')))
      ],
    );
  }
}
