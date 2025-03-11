import 'package:e_commerce/core/Theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: ThemeManager.primaryColor,
            content: Row(
              children: [
                const CircularProgressIndicator(
                  color: Colors.white,
                ),
                SizedBox(width: 18.sp),
                Text(
                  message,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ));
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
    BuildContext context,
    String message, {
    String title = 'Notification',
    String? posActionName = 'OK',
    VoidCallback? posAction,
    String? result,
  }) {
    if (result == 'success') {
      DialogUtils.showMessage(
        context,
        'User registered successfully!',
        title: 'Success',
        posActionName: 'OK',
        posAction: () {
          // Navigator.pushReplacementNamed(context, '/home');
        },
      );
    } else if (result == 'failure') {
      DialogUtils.showMessage(
        context,
        'User registration failed. Please try again.',
        title: 'Error',
        posActionName: 'Retry',
        posAction: () {

        },
      );
    } else if (result == 'exists') {
      DialogUtils.showMessage(
        context,
        'An account with this email already exists. Please log in.',
        title: 'Account Exists',
        posActionName: 'Login',
        posAction: () {
          // Navigator.pushNamed(context, '/login');
        },
      );
    }
  }
}
