
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../common/colors.dart';
import 'custom_text_field.dart';

class CustomSearchbar extends StatelessWidget {
  const CustomSearchbar(
      {super.key,
        required this.controller,
        required this.label,
        this.showFilter = true,this.onTap,
        this.onChanged});
  final TextEditingController controller;
  final bool? showFilter;
  final String label;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Icon(
         Icons.search,
          size: 5.sp,
          color: StaticColors.staticGrey,
        ),
      ),
      label: label,
icon: Icon(Icons.search),
      onChanged: onChanged,
    );
  }
}
