import 'package:aventus_machine_test/screen/cart_screen/cart_screen.dart';
import 'package:aventus_machine_test/common/colors.dart';
import 'package:aventus_machine_test/screen/home_screen/home_screen.dart';
import 'package:aventus_machine_test/screen/home_screen/profile_screen/profile_screen.dart';
import 'package:aventus_machine_test/screen/home_screen/widget/bottom_navigation_bar.dart';
import 'package:aventus_machine_test/screen/wish_list_screen/wish_list_screen.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    WishListScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void changePage(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StaticColors.staticBackground,
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: selectedIndex,
        onTap: (int index) {
          changePage(index);
        },
      ),
    );
  }
}
