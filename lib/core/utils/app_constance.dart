import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';
import 'app_enms.dart';

class AppConstance {
  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(msg),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('oK'))
        ],
      ),
    );
  }

  static Future<bool?> showToast({
    required String msg,
    required ToastStatus status,
  }) {
    return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: AppColors.choseColor(status),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static void navigatorTo({
    required BuildContext context,
    required String route,
  }) {
    Navigator.pushNamed(context, route);
  }

  static void navigatorRemovedTo({
    required BuildContext context,
    required String route,
  }) {
    Navigator.pushReplacementNamed(context, route);
  }


}
