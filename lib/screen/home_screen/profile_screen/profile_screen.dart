import 'package:aventus_machine_test/bloc/user_cubit/user_cubit.dart';
import 'package:aventus_machine_test/common/colors.dart';
import 'package:aventus_machine_test/model/user_model.dart';
import 'package:aventus_machine_test/service/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserModel>(
      bloc: locator<UserCubit>(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: StaticColors.staticWhite,
          appBar: AppBar(
            backgroundColor: StaticColors.staticWhite,
            title: Text("Profile"),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 28.sp,
                    backgroundColor: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(state.name.toString()),
                SizedBox(
                  height: 2.h,
                ),
                Text(state.email.toString()),
              ],
            ),
          ),
        );
      },
    );
  }
}
