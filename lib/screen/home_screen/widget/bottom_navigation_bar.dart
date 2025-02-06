import 'package:aventus_machine_test/screen/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });
  final int selectedIndex;

  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: BottomAppBar(
      elevation: 8,
      color: StaticColors.staticBlueGrey,
      clipBehavior: Clip.antiAlias,
      notchMargin: 0.5,
       height: 8.3.h,
      shape: const CircularNotchedRectangle(),
      child: Wrap(children: [
        ClipRRect(
          child: Theme(
            data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent),
            child: BottomNavigationBar(
              elevation: 8,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: StaticColors.staticWhite,
              unselectedItemColor: StaticColors.staticWhite,
              backgroundColor: StaticColors.staticBlueGrey,
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              onTap: onTap,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Iconsax.home_1,
                    color: StaticColors.staticWhite,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Iconsax.heart,
                    color: StaticColors.staticWhite,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Iconsax.shopping_cart,
                    color: StaticColors.staticWhite,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Iconsax.user,
                    color: StaticColors.staticWhite,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
