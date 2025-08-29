import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/icons.dart';
import '../../../core/utils/styles.dart';

class IngredientTextFormField extends StatelessWidget {
  const IngredientTextFormField({
    super.key,
    required this.hint,
    required this.validator,
    this.isPassword = false,
    required this.controller,
    this.onTap,
    this.readOnly = false,
    required this.width,
    // required this.focusNode,
  });

  // final FocusNode focusNode;
  final String hint;
  final String? Function(String?) validator;
  final bool isPassword;
  final double width;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: width,
        child: TextFormField(
          cursorColor: AppColors.pinkSubC,
          // focusNode: focusNode,
          controller: controller,
          validator: validator,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: BorderSide.none,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIcons.password),
                  )
                : null,
            filled: true,
            fillColor: AppColors.pink,
            hintText: hint,
            hintStyle: AppStyles.hintT,
            contentPadding: EdgeInsets.only(
              left: 15.w,
            ),
          ),
        ),
      ),
    );
  }
}
