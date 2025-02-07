import 'package:aventus_machine_test/bloc/user_cubit/user_cubit.dart';
import 'package:aventus_machine_test/common/colors.dart';
import 'package:aventus_machine_test/common/common.dart';
import 'package:aventus_machine_test/screen/home_screen/dash_board.dart';
import 'package:aventus_machine_test/model/user_model.dart';
import 'package:aventus_machine_test/repository/login_repository.dart';
import 'package:aventus_machine_test/service/injection/injection.dart';
import 'package:aventus_machine_test/screen/widget/custom_text_field.dart';
import 'package:aventus_machine_test/screen/widget/save_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StaticColors.staticWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 9.h),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 4.h,
            children: [
              SizedBox(
                height: 7.h,
              ),
              SizedBox(
                height: 7.h,
                child: CustomTextFormField(
                  controller: _name,
                  label: "Enter your name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("Name is required");
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 7.h,
                child: CustomTextFormField(
                  readOnly: true,
                  controller: _email,
                  label: "Enter email",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final user =
                          await locator<LoginRepository>().signInWithGoogle();
                      if (null != user) {
                        UserModel userData = UserModel(
                            name: _name.text,
                            email: user?.displayName.toString());
                        locator<UserCubit>().addUser(userData);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return DashBoard();
                        }));
                      } else {
                        Common.toast("Login failed");
                      }
                    }
                  },
                ),
              ),
              CustomButton(
                btnColor: StaticColors.staticBlueGrey,
                title: "Login",
                textColor: StaticColors.staticWhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
