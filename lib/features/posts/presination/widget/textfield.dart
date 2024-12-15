

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/colors.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({
    super.key,
    required this.hinttext,
    required this.controller,
    this.icon,
    required this.labeltext,
    this.onIconTap, this.iswntedborder, this.func,
     this.minLines
  });
final bool? iswntedborder;
  final String hinttext;
  final String labeltext;
  final TextEditingController controller;
  final IconData? icon;
  final VoidCallback? onIconTap;
 final FormFieldValidator<String>?  func;
final int? minLines;
  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding:iswntedborder!? EdgeInsets.symmetric(horizontal: 30.w): EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
      child: TextFormField(
        minLines: minLines,
        validator:func ,
        maxLines: null,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: GestureDetector(
            onTap: onIconTap,
            child: Icon(
              icon,

              size: 24,
              color: primaryColor,
            ),
          ),
          filled: true,
          fillColor: Colors.transparent,
          hintText: hinttext,
       
          labelStyle: const TextStyle(fontSize: 18, color: Colors.black),
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color:  Color(0xff082659),
          ),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          alignLabelWithHint: true,
          contentPadding:iswntedborder!? EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 15.w): EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 2.w),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder:iswntedborder!? OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: primaryColor),
          ):OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder:iswntedborder!? OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide:
                 BorderSide(color:  primaryColor,),
          ): OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide:
                const BorderSide(color: Colors.transparent,),
          ),
        ),
      ),
    );
  }
}