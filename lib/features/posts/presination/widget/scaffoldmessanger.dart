import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

void showsnackbar(String message, BuildContext context,Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message,style: TextStyle(color: whitecolor, fontSize: 20),),
backgroundColor: color,  ),
  );
}