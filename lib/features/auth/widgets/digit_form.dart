import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DigitForm extends StatelessWidget {
  const DigitForm({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 39.w,
      height: 39.h,
      child: TextFormField(
        onChanged: onChanged,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17.sp,
          color: AppColors.brownF9,
          fontFamily: 'Poppins',
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controller,
        cursorHeight: 20.h,
        cursorOpacityAnimates: true,
        focusNode: focusNode,
        decoration: InputDecoration(
          counter: SizedBox.shrink(),
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.pinkSubC),
            borderRadius: BorderRadius.circular(19.r),
          ),
          focusColor: Colors.red,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19.r),
            borderSide: BorderSide(color: AppColors.redPinkMain),
          ),
        ),
      ),
    );
  }
}
