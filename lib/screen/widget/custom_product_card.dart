import 'package:aventus_machine_test/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomProductCard extends StatelessWidget {
  final String? tile;
  final String? price;
  final String? qty;
  final Widget? image;
  final bool isCart;
  final bool isWishList;
  final void Function()? onTap;
  const CustomProductCard({
    super.key,
    this.tile,
    this.price,
    this.image,
    this.onTap,
    this.isCart = false,
    this.isWishList = false,
    this.qty,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13.sp),
        margin: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: StaticColors.staticBlueGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                  height: 12.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: image),
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 7.h,
                    child: Text(
                      tile ?? "",
                      style: TextStyle(
                          color: StaticColors.staticLabelWhite,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 0.8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price ?? "",
                        style: TextStyle(
                          color: StaticColors.staticGreen,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isCart)
                        Padding(
                          padding: EdgeInsets.only(right: 3.w),
                          child: Text(
                            qty??"",
                            style: TextStyle(
                              color: StaticColors.staticWhite,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      if(isWishList)
                        Icon(
                          Iconsax.heart,
                          color: StaticColors.staticdeepRed,
                        ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
