import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

const primaryColor = Color(0xFF232F3E);
const secondaryColor = Color(0xFFF69B32);
const blackColor2 = Color(0xff404040);
const greyColor1 = Color(0xFF696969);
const greyColor2 = Color(0xFF979797);
const greyColor3 = Color(0xfff9f9fa);
const whiteColor = Color(0xffffffff);

void message(BuildContext context, String msg) {
  ToastContext().init(context);
  Toast.show(msg, duration: Toast.lengthLong);
}
