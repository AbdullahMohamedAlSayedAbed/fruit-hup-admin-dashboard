import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

// Enum to define the type of toast message
enum ToastType { success, error, warning }

void buildErrorFunction(
    {required String message,
    required ToastType type,
    num durationInSeconds = 3}) {
  Color backgroundColor = _getBackgroundColor(type);

  Fluttertoast.showToast(
    msg: message,
    toastLength: durationInSeconds > 2 ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor,
    textColor: Colors.white,
    fontSize: 16.0,
    timeInSecForIosWeb: durationInSeconds.toInt(), // Set the duration
  );
}

// Private method to handle background color based on ToastType
Color _getBackgroundColor(ToastType type) {
  switch (type) {
    case ToastType.success:
      return Colors.green;
    case ToastType.error:
      return Colors.red;
    case ToastType.warning:
      return Colors.orange;
    default:
      return Colors.grey;
  }
}
