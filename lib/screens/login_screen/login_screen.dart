import 'package:chat_app/bloc/login_bloc/login_bloc.dart';
import 'package:chat_app/bloc/login_bloc/login_event.dart';
import 'package:chat_app/bloc/login_bloc/login_state.dart';
import 'package:chat_app/data/models/user_model/user_model.dart';
import 'package:chat_app/screens/chat_screen/chat_screen.dart';
import 'package:chat_app/utils/images/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          AppImages.friend,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Colors.white.withOpacity(0.8),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 180.h,
                  ),
                  Text(
                    "LogIn",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppImages.fontPoppins,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        hintText: "Name",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.w,
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.w,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      controller: password,
                      decoration: InputDecoration(
                        hintText: "Password",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.w,
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.w,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Email",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.w,
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.w,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppImages.fontPoppins,
                          fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      final UserModel userModel = UserModel(
                        name: name.text,
                        email: email.text,
                        phonenumber: password.text
                      );
                      context.read<UserBloc>().add(
                            AddUserEvent(
                              userModel: UserModel(
                                email: email.text,
                                name : name.text,
                                phonenumber: password.text
                              )
                            )
                          );
                      UserModel userm = UserModel(
                          email: email.text,
                          name : name.text,
                          phonenumber: password.text
                      );
                      context.read<UserBloc>().add(
                          AddUserFireStoreEvent(
                              userModell: UserModel(
                                  email: email.text,
                                  name : name.text,
                                  phonenumber: password.text
                              )
                          )
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatScreen(),
                        ),
                        (
                          route,
                        ) =>
                            false,
                      );
                    },
                    child: Container(
                      width: 200.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.w,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "LogIn",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.sp,
                            fontFamily: AppImages.fontPoppins,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
