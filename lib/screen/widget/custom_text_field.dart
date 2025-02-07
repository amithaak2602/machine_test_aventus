import 'package:aventus_machine_test/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? counterText;
  final String? labelText;
  final int? maxLines;
  final bool isEnable;
  final int? maxLength;
  final Widget? icon;
  final Widget? prefixIcon;
  final TextCapitalization? capitalization;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final bool readOnly;
  final bool isPersonalInfo;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFormField(
      {Key? key,
      this.controller,
      this.label,
      this.maxLines,
      this.isEnable = true,
      this.readOnly = false,
      this.inputFormatters,
      this.prefixIcon,
      this.capitalization = TextCapitalization.sentences,
      this.maxLengthEnforcement,
      this.icon,
      this.maxLength,
      this.textInputType,
      this.labelText,
      this.validator,
      this.focusNode,
      this.onTap,
      this.counterText,
      this.isPersonalInfo = false,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLengthEnforcement: maxLengthEnforcement ?? MaxLengthEnforcement.none,
      textCapitalization: capitalization ?? TextCapitalization.sentences,
      keyboardType: textInputType ?? TextInputType.text,
      cursorColor: StaticColors.staticGrey,
      enabled: isEnable,
      maxLength: maxLength,
      readOnly: readOnly,
      maxLines: maxLines ?? 1,
      controller: controller,
      focusNode: focusNode,
      inputFormatters: inputFormatters ?? [],
      style: TextStyle(
          color: StaticColors.staticGrey,
          fontWeight: FontWeight.normal,
          fontSize: 16.5.sp,
          fontFamily: 'Poppins'),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
        suffixIcon: icon,
        prefixIcon: prefixIcon,
        counterText: counterText,
        counterStyle: const TextStyle(
          color: Colors.black, // or any visible color
        ),
        alignLabelWithHint: true,
        focusColor: const Color(0xffeeeeee),
        filled: isPersonalInfo ? false : true,
        fillColor: StaticColors.staticWhite,
        hintText: label,
        hintStyle: TextStyle(fontSize: 16.5.sp, color: StaticColors.staticGrey),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.5, style: BorderStyle.solid, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.5, style: BorderStyle.solid, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 0.8, style: BorderStyle.solid, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
    );
  }
}
