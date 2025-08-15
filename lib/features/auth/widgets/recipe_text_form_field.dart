import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeTextFormField extends StatelessWidget {
  const RecipeTextFormField({
    this.minLine = 1,
    super.key,
    required this.label,
    required this.hint,
    required this.validator,
    this.isPassword = false,
    required this.controller,
    this.onTap,
    this.readOnly=false,
  });

  final int minLine;

  final String label, hint;
  final String? Function(String?) validator;
  final bool isPassword;

  final TextEditingController controller;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppStyles.subtitleOq,
          ),
          SizedBox(
            width: 357.w,

            child: TextFormField(
              controller: controller,
              validator: validator,
              minLines: minLine,
              maxLines: minLine + 1,
              readOnly: readOnly,
              onTap: onTap,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.5.r),
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
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 36.w,
                  vertical: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
