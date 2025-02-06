import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? btnColor;
  final Color? textColor;
  final void Function()? onTap;

  const CustomButton({Key? key,this.title,this.btnColor,this.textColor,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width/2,
        padding: const EdgeInsets.symmetric(
            horizontal: 30, vertical: 13),
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white,width: 0.8
          ),
          color: btnColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          title??"",textAlign: TextAlign.center,
          style: TextStyle(
              color:textColor,
              fontSize: 16.sp),

        ),),
    );
  }
}
